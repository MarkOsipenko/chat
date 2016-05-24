class UsersRoomsController < ApplicationController
  before_action :find_user, only: [:create, :destroy]
  before_action :find_room, only: :create

  def create
    @user.rooms << @room
    respond_to do |format|
      if @user.save
        format.js
      else
        format.html { redirect_to :back, notice: "not enter to room" }
        format.js
      end
    end
  end
  #
  # def destroy
  #   @user.rooms.delete(@room)
  #   respond_to do |format|
  #    format.html { redirect_to user_rooms(current_user), notice: "not enter to room" }
  #    format.js
  #   end
  # end

  protected

    def find_user
      @user = current_user
    end

    def find_room
      @room = Room.find(params[:room_id])
    end

end
