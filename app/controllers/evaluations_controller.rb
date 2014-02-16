class EvaluationsController < ApplicationController

	def create
    @evaluation = Evaluation.new(params[:evaluation])
    if @evaluation.save
      ContactMailer.new_evaluation(@evaluation).deliver
      flash[:success] = "Your request has been sent. We'll get back to you shortly!"
      redirect_to (:back)
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end

  def mark_read
    @evaluation = Evaluation.find(params[:id])
    @evaluation.read = true
    @evaluation.save!
    flash[:success] = "Request from <b>#{@evaluation.firstname}</b> marked as read.".html_safe
    redirect_to (:back)
  end

  def mark_unread
    @evaluation = Evaluation.find(params[:id])
    @evaluation.read = false
    @evaluation.save!
    flash[:success] = "Request from <b>#{@evaluation.firstname}</b> marked as unread.".html_safe
    redirect_to (:back)
  end

  def update
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update_attributes(params[:evaluation])
      ContactMailer.evaluation_response(@evaluation).deliver
      flash[:success] = "Your reply to <b>#{@evaluation.firstname}</b> has been sent.".html_safe
      redirect_to (:back)
    else
      flash[:error] = "This evaluation could not be found."
      redirect_to (:back)
    end
  end

  def destroy
    Evaluation.find(params[:id]).destroy
    flash[:notice] = "Evaluation request deleted."
    redirect_to(:back)
  end
end
