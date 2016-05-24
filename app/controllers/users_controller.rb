class UsersController < ApplicationController
  before_action :all_rooms, only: :show


  def show
    @rooms = current_user.rooms
  end

  protected

  def all_rooms
    @all_rooms = Room.all
  end

end
