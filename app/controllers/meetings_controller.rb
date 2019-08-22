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
    @meeting = Meeting.create!(meeting_params) do |c|  #datetime_select
       c.user_id = current_user.id
    end
    #new_start_time=[[start_time(1i), start_time(2i), start_time(3i)].join('-'), [start_time(4i), start_time(5i)].join(':') ] .join(' ')
    #@meeting.(:start_time) = new_start_time
    #new_end_time=[ [end_time(1i), end_time(2i), end_time(3i)].join('-'), [end_time(4i), end_time(5i)].join(':') ] .join(' ')
    #Meeting.StartEndTime(meeting_params[:start_time(1i)],meeting_params[:start_time(2i)],meeting_params[:start_time(3i)],meeting_params[:start_time(5i)],meeting_params[:end_time(1i)],meeting_params[:end_time(2i)],meeting_params[:end_time(3i)],meeting_params[:end_time(4i)],meeting_params[:end_time(5i)])#@meeting.(:end_time) = new_end_time
    #meeting_params[:user_id] = current_user.id
    #@meeting = Meeting.create!(meeting_params)
    if @meeting.save
      flash[:notice] = "Meeting was successfully created as meeting name #{@meeting.name}"
      redirect_to meeting_path(@meeting)
    else
      render 'new'
    end
  end

  def update
    if @meeting.update(meeting_params)
      flash[:notice] = "Meeting was successfully edited as meeting name #{@meeting.name}"
      redirect_to meeting_path(@meeting)
    else
      render 'edit'
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    flash[:notice] = "Meeting was successfully edited as meeting name #{@meeting.name}"
    redirect_to meetings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :description, :req_seats, :start_time, :end_time, :room_id, :user_id)
    end
end