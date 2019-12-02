User.create!(name: "Example User", 
             email: "user@example.com", 
             password: "foobar",
             password_confirmation: "foobar", 
             admin: true)
             
40.times do |n|
  name = Faker::Name.name
  domains = %w(gmail.com yahoo.com )
  email = "#{name}@#{domains.sample}"
  password = "pass"
  User.create!(name: name, 
               email: email,
               password: password, 
               password_confirmation: password)
end