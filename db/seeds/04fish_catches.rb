# fishing_trips = FishingTrip.all
# fish_types = FishType.all
# fish_data = { 1 => {weight: [5.0, 55.0], length: [26.0, 49.0]},
#               2 => {weight: [5.0, 18.0], length: [16.0, 33.0]},
#               3 => {weight: [2.0, 10.0], length: [16.0, 28.0]},
#               4 => {weight: [0.5, 3.0],  length: [10.0, 18.0]},
#               5 => {weight: [2.0, 12.0], length: [12.0, 24.0]}}
                       
# fishing_trips.each do |fishing_trip|
#   (rand(3) + 1).times do 
#     fish_type = fish_types.sample
#     user = fishing_trip.user
#     min_weight = fish_data[fish_type.id][:weight].first
#     max_weight = fish_data[fish_type.id][:weight].last
#     min_length = fish_data[fish_type.id][:length].first
#     max_length = fish_data[fish_type.id][:length].last
#     fish_catch = FishCatch.new(weight: rand(min_weight..max_weight),
#                               length: rand(min_length..max_length),
#                               fish_type_id: fish_type.id,
#                               user_id: user.id,
#                               fishing_trip_id: fishing_trip.id)
#     fish_catch.image = File.open("#{Rails.root}/db/seeds/images/#{fish_type.name.gsub(" ", "_")}/#{rand(5) + 1}.jpg")  
#     fish_catch.save!
#   end
# end