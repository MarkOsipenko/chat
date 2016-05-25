class MessagesController < ApplicationController
  before_action :message_params, only: :create
  before_action :find_room, only: :create

  def create
    @message = @room.messages.build(message_params)
    @message.user_id = current_user.id
    respond_to do |format|
      if @message.save
        format.html { redirect_to user_room_path(@current_user, @room) }
        format.js
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  protected

    def find_room
      @room = current_user.rooms.find(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end

end
