class StaticPagesController < ApplicationController
  def home
    @fishing_trips = FishingTrip.recent
    
    @top_fish = FishCatch.find_top_fish(:weight, 10)
  end
end
