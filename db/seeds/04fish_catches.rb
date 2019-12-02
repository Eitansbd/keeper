fishing_trips = FishingTrip.all
fish_types = FishType.all

fishing_trips.each do |fishing_trip|
  (rand(3) + 1).times do 
    fish_type = fish_types.sample
    user = fishing_trip.user
    fish_catch = FishCatch.new(weight: rand(fish_type.record_weight) + 1,
                               length: rand(fish_type.record_length) + 1,
                               fish_type_id: fish_type.id,
                               user_id: user.id,
                               fishing_trip_id: fishing_trip.id)
    fish_catch.image = File.open("#{Rails.root}/db/seeds/images/#{fish_type.name}/#{rand(5) + 1}.jpg")  
    fish_catch.save!
  end
end