class MeetController < ApplicationController
  before_action :set_meet, only: [:show, :edit, :update, :destroy]
  def index
    @meets = Meet.all
  end

  def new
    @meet=Meet.new
  end

  def edit
    @meet = Meet.find(params[:id])
  end

  def show
    @meet = Meet.find(params[:id])
  end

  def destroy
    @meet = Meet.find(params[:id])
    @meet.destroy
    flash[:success] = "room #{@meet.subject} and reated schedule deleted"   
    redirect_to meet_index_path
  end

  def create
    @meet = Meet.new(meet_params)
    if @meet.save
      flash[:success] = "View of #{@meet.subject}"   
      redirect_to meet_path(@meet)
    else      
      redirect_to new_meet_path
    end 
  end
  def update
    if Meet.update(meet_params)
      flash[:success] = "View of #{@meet.subject}"   
      redirect_to meet_path(@meet)
    else      
        render 'edit'      
    end 
  end
  def self.UpdateStatus(meet)
    Room.all.each do |room|
      if room.capacity.to_i > meet.req_seats.to_i
        Meet.all.each do |mt|
              if (mt.room_id == room._id) && (mt.meet_date_time < meet.meet_date_time && mt.meet_to_datetime > meet. meet_date_time) && (mt.meet_date_time < meet.meet_to_datetime && mt.meet_to_datetime < meet. meet_to_datetime)
                yeild
              end
          end
      end
    end
  end
  private
  def set_meet
    @meet = Meet.find(params[:id])
  end

  def meet_params
    params.require(:meet).permit(:subject, :meet_date_time, :meet_to_datetime, :description, :req_seats, :room_id)
  end
end