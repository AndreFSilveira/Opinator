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
  user_id = 1
  Opinion.create!(description: description,
  				  user_id: user_id,
            title: Faker::Name.title,
            approved: true
           )
end

10.times do |n|
  opinion_id  = 1
  user_id = 1
  Disagree.create!(opinion_id: opinion_id,
  					user_id: user_id )
end

10.times do |n|
  opinion_id  = 1
  user_id = 1
  Agree.create!(opinion_id: opinion_id,
  					user_id: user_id )
end

10.times do |n|
  description  = Faker::Lorem.paragraph
  user_id = 1
  opinion_id = 1
  Comment.create!(description: description,
  				 user_id: user_id,
  				 opinion_id: opinion_id)
end