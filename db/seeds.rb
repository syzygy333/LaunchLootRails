require "factory_girl"
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

Dir[Rails.root.join("spec/support/*.rb")].each {|f| require f}

5.times do
  user = FactoryGirl.create(:user)
  quest = FactoryGirl.create(:quest)
  Engagement.create(quest: quest, user: user)
end
