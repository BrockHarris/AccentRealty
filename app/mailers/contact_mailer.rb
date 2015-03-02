class ContactMailer < ActionMailer::Base
  default :from => "Accent Realty <Inna@accentrealtyus.com>"

  def new_evaluation(evaluation)
    @evaluation = evaluation
    @url = "http://www.accentrealtyus.com#{admin_evaluations_path}"
    mail(to: "inna@innarealestate.com", subject: "New Evaluation Request From: #{evaluation.firstname}")
  end

  def new_message(message)
    @message = message
    @url = "http://www.accentrealtyus.com#{admin_messages_path}"
    mail(to: "btharris781@gmail.com", subject: "New Message From: #{message.name}")
    #mail(to: "inna@innarealestate.com", subject: "New Message From: #{message.name}")
  end

  def message_response(message)
    @message = message
    mail(to: @message.email, subject: "#{message.response_subject}")
  end

  def new_question(question)
    @question = question
    @url = "http://www.accentrealtyus.com#{admin_questions_path}"
    mail(to: "inna@innarealestate.com", subject: "New Question From: #{question.email}")
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
    @message = message
    mail(to: recipient.email, subject: "#{message.subject}")
  end
end