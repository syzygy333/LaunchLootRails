require 'csv'

descriptor1 = CSV.read("app/assets/csv/descriptor1.csv")
ordinary = CSV.read("app/assets/csv/ordinary.csv")
heirloom = CSV.read("app/assets/csv/heirloom.csv")
antiquity = CSV.read("app/assets/csv/antiquity.csv")
descriptor2 = CSV.read("app/assets/csv/descriptor2.csv")

250.times do
  Item.create(name: "#{descriptor1[0].sample.titleize}
    #{ordinary[0].sample.titleize} of #{descriptor2[0].sample.titleize}",
    rarity: "ordinary", value: 100)
end

150.times do
  Item.create(name: "#{descriptor1[0].sample.titleize}
    #{heirloom[0].sample.titleize} of #{descriptor2[0].sample.titleize}",
    rarity: "heirloom", value: 250)
end

75.times do
  Item.create(name: "#{descriptor1[0].sample.titleize}
    #{antiquity[0].sample.titleize} of
    #{descriptor2[0].sample.titleize}", rarity: "antiquity", value: 500)
end

# 25.times do
#   Item.create(name: relic_name, rarity: relic, value: 1000 )
# end


15.times do
  quest = Quest.create!(
    title: Faker::Lorem.sentence(3),
    description: Faker::Lorem.sentence(5),
    start_date: Date.today,
    end_date: Faker::Date.between(Date.today + 7, Date.today + 14)
  )
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(10),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  Engagement.create(
    user_id: user.id,
    quest_id: quest.id
  )
end
