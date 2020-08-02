class MessagesController < ApplicationController
  before_action :set_receiver

  def index
    @messages = current_user.messages
  end

  def new
    @message = current_user.sent_messages.new
  end

  def create
    @message = current_user.sent_messages.new(message_params)
    @message.save
  end

  def show
    @message = current_user.messages.find(params[:id])
  end

  def destroy
    message = current_user.messages.delete(params[:id])
  end


  private

  def message_params
    params.require(:message).permit(:subject, :content, :receiver, :sender)
  end

  def set_receiver
    @receiver = User.find(params[:id])
  end
end
