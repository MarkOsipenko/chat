class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_room, only: :show
  before_action :room_params, only: :create

  def show
  end

  protected

    def find_room
      @room = current_user.rooms.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :users, :owner, :messages)
    end

end
