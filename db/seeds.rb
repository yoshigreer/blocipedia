include Faker

10.times do
  User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet::password
  )
end
users = User.all

50.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: false,
    user: users.sample
  )
end
wikis = Wiki.all

member = User.create!(
  username: 'member',
  email: 'member@example.com',
  password: 'helloworld'
)

admin = User.create!(
  username: 'admin',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

premium = User.create!(
  username: 'premium',
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)

puts "seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
