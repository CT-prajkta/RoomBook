class UserController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Room Booking #{@user.username}"      
      p "Welcome to the Room Booking #{@user.username}"
      redirect_to user_path(@user)
    else      
        render 'new'      
    end    
    
  end

  def update
    if @user.update(user_params)    
      flash[:success] = "Your account was updated successfully"    
      redirect_to room_path    
    else    
      render 'edit'    
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to user_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
