class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all 
  helper_method :current_user, :admin_user, :unread_messages, :pending_questions, :unread_evaluations, :verify_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_user
    @admin_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def sign_admin_in(admin)
    session[:admin_id] = admin.id
    redirect_to admin_settings_path
  end

  def sign_user_in(user)
    session[:user_id] = user.id
    redirect_to myaccount_path
  end

  def unread_messages
    @unread_messages = Message.where(:read => false, :responded_to => false)
  end

  def pending_questions
    @pending_questions = Question.where(:responded_to => false)
  end

  def unread_evaluations
    @unread_evaluations = Evaluation.where(:read => false)
  end

  def verify_admin
    unless admin_user
      redirect_to root_path
      flash[:notice] = "You are not authorized to make that request."
    end
  end

  def login_required
    unless current_user
      store_location
      flash[:notice] = "Please sign in first!"
      redirect_to subscribe_path
      return false
    end
  end
end
