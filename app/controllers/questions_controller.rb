class QuestionsController < ApplicationController
	def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:success] = "Thanks, we'll get back to you soon!"
      redirect_to (:back)
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end
end
