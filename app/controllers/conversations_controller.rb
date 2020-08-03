class ConversationsController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def create
    @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first_or_create(conversation_params)

    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end
end
