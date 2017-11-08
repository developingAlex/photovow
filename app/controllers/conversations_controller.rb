class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show]

  def index
    conversations_as_sender = Conversation.where(sender: current_user)
    conversations_as_recipient = Conversation.where(recipient: current_user)
    @conversations = conversations_as_sender | conversations_as_recipient
  end

  def show
    @messages = Message.where(conversation: @conversation).order(created_at: :asc) 
    @message = Message.new
  end

  def new
  end

  def create
  end
  
  private

    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    def conversation_params
      params.require(:conversation).permit(:sender_id, :recipient_id)
    end
end
