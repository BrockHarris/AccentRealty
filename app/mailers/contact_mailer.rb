class ContactMailer < ActionMailer::Base
  default :from => "service@accentrealtyus.com"
  # default :to => "inna@innarealestate.com"
  default :to => "btharris781@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "New website inquiry from: #{message.name}")
  end

  def new_evaluation(evaluation)
    @evaluation = evaluation
    mail(:subject => "New evaluation request from: #{evaluation.name}")
  end
end