class QuestionsController < ApplicationController
	
  def create
    @question = Question.new(params[:question])
    if @question.valid?
      ContactMailer.new_question(@question).deliver
      @question.save
      flash[:success] = "Question sent. We'll get back to you soon!"
      redirect_to (:back)
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      if params[:deliver]
        ContactMailer.question_response(@question).deliver
        flash[:success] = "Your reply to <b>#{@question.email}</b> has been sent.".html_safe
        redirect_to (:back)
      elsif params[:deliver_and_publish]
        @question.published = true
        @question.save!
        ContactMailer.question_response(@question).deliver
        flash[:success] = "Your reply to <b>#{@question.email}</b> has been sent.".html_safe
        redirect_to (:back)
      else
        flash[:success] = "Question updated."
        redirect_to (:back)
      end
    else
      flash[:error] = "This question could not be found."
      redirect_to (:back)
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:notice] = "Question deleted."
    redirect_to(:back)
  end
end
