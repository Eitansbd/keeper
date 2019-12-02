require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean


# Fish types
# weight in kg, length in cm
fish_types = [["Striped Bass",37.14,  117.0],
              ["Bluefish", 14.40, 87.0],
              ["Fluke", 10.17, 38.25],
              ["Scup", 2.06, 50], 
              ["Blackfish", 13.07, 80.65]]
              
fish_types.each do |name, record_weight, record_length|
  FishType.create(name: name, 
                  record_weight: record_weight, 
                  record_length: record_length)
end

User.create!(name: "Example User", 
             email: "example@testing.org", 
             password: "foobar",
             password_confirmation: "foobar", 
             admin: true)
             
99.times do |n|
  name = Faker::Name.name
  email = "Example-#{n+1}@testing.org"
  password = "password"
  User.create!(name: name, 
               email: email,
               password: password, 
               password_confirmation: password)
end

users = User.order(:created_at).take(3)

50.times do
  weather = Faker::Lorem.sentence(2)
  content = Faker::Lorem.sentence(5)
  users.each do |user| 
    fishing_trip = user.fishing_trips.create!(content: content,
                                              weather: weather,
                                              title: "Sample Title", 
                                              body_of_water: "LIS", 
                                              location: "Little Neck", 
                                              start_time: 2.day.ago,
                                              end_time: 1.day.ago,
                                              date: 1.day.ago)

    rand(3).times do 
      fishing_trip.fish_catches.create!(weight: rand(30) + 1,
                                      length: rand(100) + 1,
                                      fish_type_id: 1,
                                      user_id: user.id)
      fishing_trip.fish_catches.create!(weight: rand(14) + 1,
                                      length: rand(60) + 1,
                                      fish_type_id: 2,
                                      user_id: user.id)
      fishing_trip.fish_catches.create!(weight: rand(10) + 1,
                                      length: rand(35) + 1,
                                      fish_type_id: 3,
                                      user_id: user.id)
      fishing_trip.fish_catches.create!(weight: rand(2) + 1,
                                      length: rand(50) + 1,
                                      fish_type_id: 4,
                                      user_id: user.id)
      fishing_trip.fish_catches.create!(weight: rand(13) + 1,
                                      length: rand(70) + 1,
                                      fish_type_id: 5,
                                      user_id: user.id)
    end
  end
end


