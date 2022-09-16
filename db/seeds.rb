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
        location:"West Seattle",
        imglink: "https://i.ibb.co/TgJT118/delridge.png"
    },
    {
        name:"Jefferson Skate Park",
        location:"Beacon Hill",
        imglink: "https://i.ibb.co/yRj6DXP/jefferson.png"
    }, 
    {
        name:"Judkins Skate Park",
        location:"Central District",
        imglink:"https://i.ibb.co/brj5YDr/judkins.png"
    }, 
    {
        name:"Seattle Center Skate Plaza (Seask8)",
        location:"Seattle Center",
        imglink:"https://i.ibb.co/28Lv9Vp/Screen-Shot-2022-09-15-at-3-16-52-PM.png"
    }, 
    {
        name:"Lower Woodland Skate Park",
        location:"Greenlake",
        imglink:"https://i.ibb.co/bgB1DsV/lower-woodland.png"
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
        location: sp[:location],
        imglink: sp[:imglink]
    )
end

30.times do
    first_name = fake_first_name()
    last_name = fake_last_name()
    @checkedIn = rand(0..1)
    if @checkedIn === 1
        User.create(
            first_name: first_name,
            last_name: last_name,
            email: "#{first_name}.#{last_name}@email.com",
            password: Faker::Internet::password,
            category_id: rand(1..6),
            checkedIn: @checkedIn,
            skatepark_id: rand(1..6)
        )
    else
        User.create(
            first_name: first_name,
            last_name: last_name,
            email: "#{first_name}.#{last_name}@email.com",
            password: Faker::Internet::password,
            category_id: rand(1..6),
            checkedIn: @checkedIn
        )
    end
    # User.create(
    #     first_name: first_name,
    #     last_name: last_name,
    #     email: "#{first_name}.#{last_name}@email.com",
    #     password: Faker::Internet::password,
    #     category_id: rand(1..6),
    #     checkedIn: checkedIn,
    #     skatepark_id: rand(1..6)
    # )
end



categories.map do |c|
    Category.create(
        name:c
    )
end


puts "✅ Done seeding!"
