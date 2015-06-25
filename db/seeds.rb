10.times do |n|
  name  = Faker::Name.name
  uid = Faker::Bitcoin.address
  logged = [true, false].sample
  User.create!(name:  name,
              uid: uid,
              logged: logged,)
end

20.times do |n|
  description  = Faker::Lorem.paragraph
  user_id = User.ids.sample
  Opinion.create!(description: description,
  				  user_id: user_id,
            title: Faker::Name.title,
            approved: true
           )
end

10.times do |n|
  opinion_id  = Opinion.ids.sample
  user_id = User.ids.sample
  Disagree.create!(opinion_id: opinion_id,
  					user_id: user_id )
end

10.times do |n|
  opinion_id  = Opinion.ids.sample
  user_id = User.ids.sample
  Agree.create!(opinion_id: opinion_id,
  					user_id: user_id )
end

10.times do |n|
  description  = Faker::Lorem.paragraph
  opinion_id  = Opinion.ids.sample
  user_id = User.ids.sample
  Comment.create!(description: description,
  				 user_id: user_id,
  				 opinion_id: opinion_id)
end