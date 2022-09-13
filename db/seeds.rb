require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here
categories = ["skateboard", "inlineskates", "rollerskates", "scooter", "bike", "other"]
skateparks = [
    {
        name: "Cal Anderson Improvised Skate Park",
        location:"Capitol Hill"
    }, 
    {
        name:"Delridge Skate Park",
        location:"West Seattle"
    },
    {
        name:"Jefferson Skate Park",
        location:"Beacon Hill"
    }, 
    {
        name:"Judkins Skate Park",
        location:"Central District"
    }, 
    {
        name:"Seattle Center Skate Plaza",
        location:""
    }, 
    {
        name:"Lower Woodland Skate Park",
        location:"Greenlake"
    }]

def fake_first_name
    Faker::Name.first_name
end

def fake_last_name
    Faker::Name.last_name
end

skateparks.map do |sp|
    Skatepark.create(
        name: sp[:name],
        location: sp[:location]
    )
end

10.times do
    first_name = fake_first_name()
    last_name = fake_last_name()
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}.#{last_name}@email.com",
        password: Faker::Internet::password,
        category_id: rand(1..6),
        checkedIn: false,
        skatepark_id: null
    )
end



categories.map do |c|
    Category.create(
        name:c
    )
end


puts "✅ Done seeding!"
