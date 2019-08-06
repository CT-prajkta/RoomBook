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
    @meet = Meet.new(params[:id])
    @meet.destroy
    flash[:success] = "room #{@meet.subject} and reated schedule deleted"   
  end

  def create
    @meet = Meet.new(meet_params)
    if @meet.save
      flash[:success] = "View of #{@meet.subject}"   
      redirect_to meet_path(@meet)
    else      
        render 'new'      
    end 
  end
  def update
    @meet = Meet.new(meet_params)
    if @meet.save
      flash[:success] = "View of #{@meet.subject}"   
      redirect_to meet_path(@meet)
    else      
        render 'edit'      
    end 
  end
  private
  def set_meet
    @meet = Meet.find(params[:id])
  end

  def meet_params
    params.require(:meet).permit(:subject)
  end

end
