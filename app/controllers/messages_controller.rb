class MessagesController < ApplicationController
  before_action :set_chat, only: %i[new create]
  
  def new
    @message = @chat.messages.new
  end

  def create
    @message = @chat.messages.create!(message_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @chat }
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end