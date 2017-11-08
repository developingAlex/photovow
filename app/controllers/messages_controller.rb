class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.author = current_user
      respond_to do |format|
        if @message.save
          format.html { redirect_to conversation_path(@message.conversation), notice: 'Listing was successfully created.' }
          format.json { render :show, status: :created, location: @message }
        else
          format.html { render :new }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id)
  end
end
