class UserMailer < ActionMailer::Base
  default :from => "service@accentrealtyus.com"

  def welcome(user)
    @user = user
    mail(:to => ["#{user.email}"], :subject => "Thanks for joining Accent Realty!")
  end

  def recovery_service(user)
    if user.deleted_at.nil?
      @user = user
      @url  = reset_url(:id => user.id, :reset_code => user.reset_code, :host => SITE_URL_HOST)
      mail(:to => ["#{user.email}"], :subject => "Your Accent Realty password reset request:")
    end
  end
end