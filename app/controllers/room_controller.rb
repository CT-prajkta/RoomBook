class RoomController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  def index
    @rooms= Room.all
  end

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:danger] = "Room and all meets related to this room deleted"
    redirect_to room_index_path
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Welcome to the Room  #{@room.room_no}"      
      redirect_to room_path(@room)
    else      
        render 'new'      
    end
  end
  def update
    if @room.update(room_params)
      flash[:success] = "Welcome to the Room  #{@room.room_no} with updated details"      
      redirect_to room_path(@room)
    else      
        render 'edit'      
    end
  end
  private
    
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:room_no, :capacity)
  end
end
