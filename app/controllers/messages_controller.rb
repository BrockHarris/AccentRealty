class MessagesController < ApplicationController
	
	def create
    @message = Message.new(params[:message])
    if @message.valid?
      ContactMailer.new_message(@message).deliver
      @message.save
      redirect_to root_path
      flash[:success] = "Your message has been sent, we'll get back to you shortly!"
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end

  def mark_read
    @message = Message.find(params[:id])
    @message.read = true
    @message.save!
    flash[:success] = "Message from <b>#{@message.name}</b> marked as read.".html_safe
    redirect_to (:back)
  end

  def mark_unread
    @message = Message.find(params[:id])
    @message.read = false
    @message.save!
    flash[:success] = "Message from <b>#{@message.name}</b> marked as unread.".html_safe
    redirect_to (:back)
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      if @message.responded_to?
        ContactMailer.message_response(@message).deliver
        flash[:success] = "Your reply to <b>#{@message.name}</b> has been sent.".html_safe
        redirect_to (:back)
      else
        flash[:success] = "Message updated."
        redirect_to (:back)
      end
    else
      flash[:error] = "This message could not be found."
      redirect_to (:back)
    end
  end

  def destroy
    Message.find(params[:id]).destroy
    flash[:notice] = "Message deleted."
    redirect_to(:back)
  end
end
