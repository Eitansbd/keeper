class FishingTripsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]  
  
  def new
    @fishing_trip = FishingTrip.new
  end
  
  def create
    @fishing_trip = current_user.fishing_trips.build(fishing_trip_params)
    if @fishing_trip.save 
      flash[:success] = "Fishing trip saved!"
      redirect_to root_url
    else
      render 'static_page/home'
    end
  end
  
  def destroy
  end
  
  private
    
    def fishing_trip_params
      params.require(:fishing_trip).permit(:content)
    end
end
