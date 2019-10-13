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
