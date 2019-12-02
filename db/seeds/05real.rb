user = User.find(1)

content = "Went out today early in the morning. Sees were flat and we got on the " +
          "fish right away. We probably caught about 8 bass total, the biggest " +
          "one around 20lbs."

weather = "Mostly sunny with some clouds. Winds were at 5KT from the SW"

fishing_trip = user.fishing_trips.create!(content: content,
                                          weather: weather,
                                          title: "Sample Title", 
                                          body_of_water: "LIS", 
                                          location: "Little Neck", 
                                          start_time: 0.day.ago,
                                          end_time: 0.day.ago,
                                          date: 0.day.ago)
 
user = fishing_trip.user

fish_catch = FishCatch.new(weight: 20,
                           length: 37,
                           fish_type_id: 1,
                           user_id: user.id,
                           fishing_trip_id: fishing_trip.id)
fish_catch.image = File.open("#{Rails.root}/db/seeds/images/custom/bass1.jpg")  
fish_catch.save!

fish_catch = FishCatch.new(weight: 15,
                           length: 35,
                           fish_type_id: 1,
                           user_id: user.id,
                           fishing_trip_id: fishing_trip.id)
fish_catch.image = File.open("#{Rails.root}/db/seeds/images/custom/bass2.jpg")  
fish_catch.save!

fish_catch = FishCatch.new(weight: 12,
                           length: 33,
                           fish_type_id: 1,
                           user_id: user.id,
                           fishing_trip_id: fishing_trip.id)
fish_catch.image = File.open("#{Rails.root}/db/seeds/images/custom/bass3.jpg")  
fish_catch.save!

