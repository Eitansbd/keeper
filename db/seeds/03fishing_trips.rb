users = User.order(:created_at).take(6)

weather_hsh = { overview: ["Windy", "Sunny", "Overcast", "Rough on the water"],
                wind_dir: %w(N E W S NE NW SE SW),
                wind_speed: [5, 10, 15, 20]
          }

content1 = "Good day OTW, found the fish early and had good action from the end " +
           "of the outgoing to the beginning of the incoming. Had one big one on " +
           "that we lost by the boat, but otherwise a great day."
           
content2 = "Tough day today. Fish just didn't cooperate. Tried a few spots but no luck. " + 
           "The plan is to try again tomorrow morning. Hopefully one day will make a difference."
           
content3 = "What an awesome day of fishing. Started out running east to one of my favorite " +
           "spots and it really paid off. We had fish coming over the rails from the first cast." +
           "Nothing huge today but one of the better days we've had in a long time."
           
contents = [content1, content2, content3]

bodies_and_locations = [["Western Sound", ["Little Neck", "Hempstead Harbor", "Fort Totten"]],
                        ["Montauk", ["Lighthouse", "Turtlecove", "The Rips"]],
                        ["New York Bight" , ["Sandy Hook Bay", "Raritan Bay"]]]

titles = ["Great Day Fishing", "Awesome Afternoon Bite", "Red Hot Fishing", 
          "Fishing At It's Best", "Still Looking For A Monster"]

users.each do |user|
  30.times do |num|
    weather = "#{weather_hsh[:overview].sample}. Winds were #{weather_hsh[:wind_speed].sample} kt from the #{weather_hsh[:wind_dir].sample}"
    content = contents.sample
    where = bodies_and_locations.sample
    body_of_water = where.first
    location = where.last.sample
    title = titles.sample
    random_num = rand(2..24)
    start_time = random_num.hours.ago
    end_time = rand(1...random_num).hours.ago
    user.fishing_trips.create!(content: content,
                               weather: weather,
                               title: title,
                               body_of_water: body_of_water,
                               location: location,
                               start_time: start_time,
                               end_time: end_time,
                               date: num.day.ago,
                               created_at: num.day.ago)
  end
end