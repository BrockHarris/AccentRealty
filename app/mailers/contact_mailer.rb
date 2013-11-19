class ContactMailer < ActionMailer::Base
  default :from => "forwarding@accentrealtyus.com"
  # default :to => "inna@innarealestate.com"

  def new_message(message)
    @message = message
    mail(:subject => "New web message from: #{message.name}")
  end
end