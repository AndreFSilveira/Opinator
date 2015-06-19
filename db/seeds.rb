10.times do |n|
  name  = Faker::Name.name
  uid = Faker::Bitcoin.address
  logged = false
  User.create!(name:  name,
              uid: uid,
              logged: logged,)
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