class UsersController < ApplicationController

	def myaccount
		unless current_user
			redirect_to subscribe_path
    else
      redirect_to settings_path
		end
	end

	def create
    @user = User.new(params[:user])
    if @user.save
      if admin_user
        flash[:notice] = "New user successfully added."
    	  redirect_to (:back)
      else
        @user.send_welcome_email!
        flash[:notice] = "Thanks for signing up!"
        sign_user_in(@user)
      end
    else
    	flash[:notice] = "There was a problem with the information you entered."
    	redirect_to (:back)
    end
  end

  def assist
    @email = params[:email]
    if request.post? && !@email.blank?
      user = User.find_by_email(@email)
      if user.nil? || !user.deleted_at.nil?
        flash.now[:error] = "We don't have an active account listed for '#{@email}'. Please try again, or contact us if you need further assistance."
      else
        user.send_reset_password_email!
        flash[:notice] = "An email has been sent to #{@email}.<br />".html_safe
        flash[:notice] << "Follow the instructions in the email to reset your password."
        redirect_to (:back)
      end
    end
  end

  def reset
    @user = User.find_by_id(params[:id])
    code = params[:reset_code]
    if request.post?
      if !params[:password].nil?
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]

        # If the password has already been set, this doesn't normally cause a validation error, but we want it to here.
        if @user.valid? && @user.password.blank?
          @user.errors.add(:password, ActiveRecord::Errors.default_error_messages[:blank])
        end

        if @user.errors.empty?
          @user.reset_code = nil
          @user.reset_code_at = nil
          @user.save!
          flash[:success] = "Password successfully reset."
          sign_user_in(@user)
        end
      else
        render :action => "reset"
      end
    elsif request.get?
      if @user.blank? || code.blank?
        flash[:error] = "The link from your password reset may have been cut off, please try again."
        redirect_to assist_path
        return
      end
    end
  end

  def settings
    @user = current_user
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Account Settings Saved."
      redirect_to (:back)
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if admin_user
      flash[:notice] = "User successfully removed."
      redirect_to (:back)
    else 
      session[:user_id] = nil
      flash[:notice] = "Your account has been deactivated."
      redirect_to root_path
    end
  end
end
