class MessagesController < ApplicationController
	
	def create
    @message = Message.new(params[:message])
    if @message.valid?
      ContactMailer.new_message(@message).deliver
      redirect_to root_path
      flash[:notice] = "Your message has been sent, we'll get back to you shortly!"
    else
      flash[:notice] = "Please check that the entire form is complete."
      redirect_to (:back)
    end
  end
end
