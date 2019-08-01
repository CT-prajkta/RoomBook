class MeetController < ApplicationController
  def index
    @meets = Meet.all
  end

  def new
    @meet=Meet.new
  end

  def edit
  end

  def show
    @meet = Meet.find(params[:id])
  end

  def destroy
  end

  def create
  end
end
