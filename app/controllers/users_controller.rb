class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :create_image]
  before_action :correct_user, only: [:edit, :update, :create_image]
  before_action :admin_user, only: :destroy
  before_action :no_account, only: [:new, :create]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @fishing_trips = @user.fishing_trips.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @top_fish = @user.top_fish
  end
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Keeper!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
  
    if @user.update_attributes(user_params)
      flash[:success] = "Infomation updated successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def create_image
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:profile_image))
      respond_to do |format|
        format.html do
          flash[:success] = "You updated your profile picture"
          redirect_to user_path @user
        end
        format.json { render json: { url: @user.profile_image.url }, status: :ok }
      end
    else
      respond_to do |format|
        format.html do 
          flash.now = "Could not update picture. Please try again later"
        end
        format.json { render json: { error: "Could not update picture. Please try again later", status: 422 }}
      end
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url, status: 403) unless current_user.admin?
    end
    
    def no_account 
      redirect_to(user_path(current_user), status: 403) if logged_in?
    end
end
