puts "🌱 Seeding spices..."

# Seed your database here
categories = ["skateboard", "inlineskate", "rollerskate", "scooter","other"]

def fake_first_name
    Faker::Name.first_name
end

def fake_last_name
    Faker::Name.last_name
end

# 10.times do
#     first_name = fake_first_name()
#     last_name = fake_last_name()
#     User.create(
#         first_name: first_name,
#         last_name: last_name,
#         email: "#{first_name}.#{last_name}@email.com",
#         category: ["jet-setter", "vanlifer", "traveler"][rand(0..2)],
#         password: Faker::Internet::password,
#         follower_id: rand(1..10)
#     )
# end

categories.map do |c|
    Category.create(
        category_name:c
    )
end



puts "✅ Done seeding!"
