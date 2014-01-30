class UsersController < ApplicationController

	def myaccount
		unless current_user
			redirect_to subscribe_path
		end
	end

	def create
    @user = User.new(params[:user])
    if @user.save
    	@user.send_welcome_email!
      flash[:notice] = "Thanks for signing up!"
      sign_user_in(@user)
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
        redirect_to subscribe_path
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
          flash[:notice] = "Your password has been successfully reset!"
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
    if @user.pending?
      if @user.update_attributes(params[:user])
        flash[:notice] = "Thanks for signing up! An email has been sent to #{@user.email} with instructions on how to immediately activate your account."
        session[:user_id] = nil
        redirect_to root_url
      else
        flash[:error] = "There was a problem with your info, please try again."
        redirect_to (:back)
      end
    else
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to((:back), :notice => 'Your account has been updated!') }
          format.json { respond_with_bip(@user) }
        else
          format.html { redirect_to((:back), :notice => 'There was a problem with your info, please try again.') }
          format.json { respond_with_bip(@user) }
        end
      end
    end
  end

  def destroy
    User.find(@user).destroy
    @user = User.find(params[:id])
    flash[:notice] = "User successfully removed."
    redirect_to(:back)
  end
end
