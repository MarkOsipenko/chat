class UsersRoomsController < ApplicationController
  before_action :find_room, only: [:create]
  before_action :all_rooms, only: [:create, :destroy]
  before_action :delete_room, only: [:destroy]

  def create
    respond_to do |format|
      if current_user.rooms << @room
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def destroy
    current_user.rooms.delete(@room)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  protected

    def delete_room
      @room = current_user.rooms.find(params[:room_id])
    end

    def find_room
      @room = Room.find(params[:room_id])
    end

    def all_rooms
      @all_rooms = Room.all
    end
end
