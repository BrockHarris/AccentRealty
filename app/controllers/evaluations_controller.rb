class EvaluationsController < ApplicationController

	def create
    @evaluation = Evaluation.new(params[:evaluation])
    if @evaluation.valid?
      ContactMailer.new_evaluation(@evaluation).deliver
      redirect_to (:back)
      flash[:success] = "Your evaluation has been submitted, we'll get back to you shortly!"
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end
end
