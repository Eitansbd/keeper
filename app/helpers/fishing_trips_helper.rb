module FishingTripsHelper
  def fishing_trip_fish_catches_image(fishing_trip, sizing)
    if fishing_trip.fish_catches.empty?
      fishing_trip.user.profile_image.url(sizing)
    else
      fishing_trip.fish_catches.first.image.url(sizing)
    end
  end
end
