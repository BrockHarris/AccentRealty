class QuestionsController < ApplicationController
	def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to (:back)
      flash[:succcess] = "Thanks for your question, we'll get back to you shortly!"
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end
end
