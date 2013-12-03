class ContactMailer < ActionMailer::Base
  default :from => "forwarding@accentrealtyus.com"
  # default :to => "inna@innarealestate.com"

  def new_message(message)
    @message = message
    mail(:subject => "New website inquiry from: #{message.name}")
  end
end