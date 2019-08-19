class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  
  def index
    @meetings = Meeting.all
  end

  def show
  end

  def new
    if current_user
      @meeting = Meeting.new
      @meetings = Meeting.all
      @rooms = Room.all
    else
      flash[:notice] = "Please login"
      redirect_to login_path
    end
  end

  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    #params[:meeting][:user_id] = current_user.id
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      flash[:notice] = "Meeting was successfully created as meeting name {@meeting.name}"
      redirect_to meeting_index_path
    else
      redirect_to new_meeting_path
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    if @meeting.update(meeting_params)
      flash[:notice] = "Meeting was successfully edited as meeting name {@meeting.name}"
      redirect_to meeting_index_path
    else
      redirect_to new_meeting_path
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    flash[:notice] = "Meeting was successfully edited as meeting name {@meeting.name}"
    redirect_to meeting_index_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :description, :req_seats, :start_time, :end_time, :room_id)
    end
end
