class ContactMailer < ActionMailer::Base
  default :from => "Inna@accentrealtyus.com"

  def new_evaluation(evaluation)
    @evaluation = evaluation
    mail(to: "btharris781@gmail.com", subject: "New Evaluation Request From: #{evaluation.firstname}")
    # mail(to: "inna@innarealestate.com", subject: "New Message From: #{message.name}")
  end

  def new_message(message)
    @message = message
    mail(to: "btharris781@gmail.com", subject: "New Message From: #{message.name}")
    # mail(to: "inna@innarealestate.com", subject: "New Message From: #{message.name}")
  end

  def message_response(message)
    @message = message
    mail(to: @message.email, subject: "#{message.response_subject}")
  end

  def new_question(question)
    @question = question
    mail(to: "btharris781@gmail.com", subject: "New Question From: #{question.email}")
    # mail(to: "inna@innarealestate.com", subject: "New Question From: #{question.email}")
  end

  def question_response(question)
    @question = question
    mail(to: @question.email, subject: "Re: #{question.content}")
  end
  
  def evaluation_response(evaluation)
    @evaluation = evaluation
    mail(to: @evaluation.email, subject: "#{evaluation.response_subject}")
  end

  def self.send_newsletter(message)
    @recipients = User.where(:updates_news => true)
    @recipients.each do |recipient|
       newsletter(recipient, message).deliver
    end
  end

  def newsletter(recipient, message)
     mail(to: recipient.email, subject: "#{message.subject}")
  end
end