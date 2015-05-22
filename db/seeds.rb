10.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name:  name,
              email: email,
              password: password,)
end

20.times do |n|
  description  = Faker::Lorem.paragraph
  user_id = rand(1..10)
  Opinion.create!(description: description,
  				  user_id: user_id )
end

10.times do |n|
  opinion_id  = rand(1..20)
  user_id = rand(1..10)
  Disagree.create!(opinion_id: opinion_id,
  					user_id: user_id )
end

10.times do |n|
  opinion_id  = rand(1..20)
  user_id = rand(1..10)
  Agrees.create!(opinion_id: opinion_id,
  					user_id: user_id )
end

5.times do |n|
  description  = Faker::Lorem.paragraph
  user_id = rand(1..10)
  opinion_id = rand(1..20)
  Comments.create!(description: description,
  				 user_id: user_id,
  				 opinion_id: opinion_id)
end