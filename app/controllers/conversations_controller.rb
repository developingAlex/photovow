class ConversationsController < ApplicationController
  def index
    conversations_as_sender = Conversation.where(sender: current_user)
    conversations_as_recipient = Conversation.where(recipient: current_user)
    @conversations = conversations_as_sender | conversations_as_recipient
  end

  def show
  end

  def new
  end

  def create
  end
end
