class ContactMailer < ActionMailer::Base
  default :from => "ask@accentrealtyus.com"

  def new_message(message)
    @message = message
    mail(to: "btharris781@gmail.com", subject: "New Message From: #{message.name}")
    # mail(to: "inna@innarealestate.com", subject: "New Message From: #{message.name}")
  end

  def new_evaluation(evaluation)
    @evaluation = evaluation
    mail(to: "btharris781@gmail.com", subject: "New Evaluation Request From: #{evaluation.name}")
    # mail(to: "inna@innarealestate.com", subject: "New Message From: #{message.name}")
  end

  def message_response(message)
    @message = message
    mail(to: @message.email, subject: "#{message.response_subject}")
  end
end