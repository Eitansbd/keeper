users = User.order(:created_at).take(6)

weather = { overview: ["Windy", "Sunny", "Overcast", "Rough on the water"],
            wind_dir: %w(N E W S NE NW SE SW),
            wind_speed: [5, 10, 15, 20]
          }

content1 = "Good day OTW, found the fish early and had good action from the end " +
           "of the outgoing to the beginning of the incoming. Had one big one on " +
           "that we lost by the boat, but otherwise a great day".
           
content2 = "Tough day today. Fish just didn't cooperate. Tried a few spots but no luck. " + 
           "The plan is to try again tomorrow morning. Hopefully one day will make a difference"
           
content3 = "What an awesome day of fishing. Started out running east to one of my favorite " +
           "spots and it really paid off. We had fish coming over the rails from the first cast." +
           "Nothing huge today but one of the better days we've had in a long time"
           
contents = [content1, content2, content3]

users.each do |user|
  30.times do |num|
    weather = "#{weather[:overview]}. Winds were #{weather[:wind_speed]} from the #{weather[:wind_dir]}"
    content = contents.sample
    user.fishing_trips.new(content: content,
                               weather: weather,
                               title: "Sample Title", 
                               body_of_water: "LIS", 
                               location: "Little Neck", 
                               start_time: 2.day.ago,
                               end_time: 1.day.ago,
                               date: num.day.ago,
                               created_at: num.day.ago)
  end
end