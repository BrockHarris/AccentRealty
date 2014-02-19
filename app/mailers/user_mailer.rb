class UserMailer < ActionMailer::Base
  default :from => "Accent Realty <service@accentrealtyus.com>"

  def welcome(user)
    @user = user
    mail(:to => ["#{user.email}"], :subject => "Welcome to Accent Realty!")
  end

  def recovery_service(user)
    if user.deleted_at.nil?
      @user = user
      @url  = reset_url(:id => user.id, :reset_code => user.reset_code, :host => SITE_URL_HOST)
      mail(:to => ["#{user.email}"], :subject => "Your Accent Realty Password Recovery Request:")
    end
  end
end