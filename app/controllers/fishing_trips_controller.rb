class FishingTripsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :create, :destroy]
  
  def index
    @fishing_trips = FishingTrip.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @user = current_user
    @fishing_trip = current_user.fishing_trips.build()
  end
  
  def create
    @fishing_trip = current_user.fishing_trips.build(fishing_trip_params)
    
    if @fishing_trip.save 
      flash[:success] = "Fishing trip saved!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @fishing_trip = FishingTrip.find(params[:id])
  end
  
  def update
    @fishing_trip = FishingTrip.find(params[:id])
    if @fishing_trip.update_attributes(fishing_trip_params) 
      flash[:success] = "Fishing Trip Updated Successfully"
      redirect_to fishing_trip_url
    else
      render 'edit'
    end
  end
  
  def show
    @fishing_trip = FishingTrip.find(params[:id])
    @fish_types = FishType.all
  end
  
  def destroy
    @fishing_trip = FishingTrip.find(params[:id])
    
    if @fishing_trip.destroy
      flash[:success] = "Fishing Trip Deleted"
      redirect_to user_path current_user
    else
      flash.now[:error] = "Something Went Wrong. Please Try Again Later"
    end
  end
  
  private
    
    def fishing_trip_params
      params.require(:fishing_trip).permit(:title, :content, :weather, 
                                           :body_of_water, :location, :date,
                                           :start_time, :end_time)
    end
    
    def correct_user
      user = FishingTrip.find(params[:id]).user
      redirect_to root_url, status: 403 unless current_user?(user)
    end
end
