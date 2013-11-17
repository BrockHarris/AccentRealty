class ContactMailer < ActionMailer::Base
  default :from => "inquiries@accentrealtyus.com"
  default :to => "btharris781@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "New Accent Realty inquiry from: #{message.name}")
  end
end