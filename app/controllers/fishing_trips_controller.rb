class FishingTripsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]  
  
  def new
    @fishing_trip = FishingTrip.new
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
  end
  
  private
    
    def fishing_trip_params
      params.require(:fishing_trip).permit(:title, :content, :weather, 
                                           :body_of_water, :location, :date,
                                           :start_time, :end_time)
    end
end
