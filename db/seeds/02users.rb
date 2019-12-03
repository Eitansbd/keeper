User.create!(name: "Example User", 
             email: "user@example.com", 
             password: "foobar",
             password_confirmation: "foobar", 
             admin: true)
             
40.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "fakepassword"
  user = User.new(name: name, 
               email: email,
               password: password, 
               password_confirmation: password)
end