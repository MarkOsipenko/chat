class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_room, only: :show
  before_action :find_all_rooms, only: [:show, :create]
  before_action :room_params, only: :create

  def create
    @room = current_user.rooms.build(room_params)
    @room.owner_id = current_user.id
    respond_to do |format|
      if @room.save
        current_user.rooms << @room

        format.html { redirect_to root_path }
        format.js
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def show
  end

  protected

    def find_room
      @room = current_user.rooms.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :owner)
    end

    def find_all_rooms
      @rooms = Room.all
    end
end
