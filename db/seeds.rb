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

users = User.order(:created_at).take(6)
50.times do 
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.fishing_trips.create!(content: content) }
end
