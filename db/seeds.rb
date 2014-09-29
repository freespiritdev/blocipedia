require 'faker'


# Create Wikis
 15.times do
   Wiki.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 Wikis = Wiki.all

 50.times do
  Page.create!(
    user:   users.sample,
     wiki:  pages.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )


 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save
 u.update_attribute(:role, 'admin')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Page.count} pages created"
