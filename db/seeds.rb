# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "factory_girl"

RandomWord.exclude_list << /.*_.*/

def generate_item_name
  "#{RandomWord.adjs.next} #{RandomWord.nouns.next} of #{RandomWord.nouns.next}".titleize
end

rarity_names = ["junk", "heirloom", "antiquity", "relic"]
values = [100, 250, 500, 1000]

250.times do
  Item.create!(name: generate_item_name, rarity: rarity_names[0], value: values[0])
end

150.times do
  Item.create!(name: generate_item_name, rarity: rarity_names[1], value: values[1])
end

75.times do
  Item.create!(name: generate_item_name, rarity: rarity_names[2], value: values[2])
end

25.times do
  Item.create!(name: generate_item_name, rarity: rarity_names[3], value: values[3])
end

Dir[Rails.root.join("spec/support/*.rb")].each {|f| require f}

5.times do
  user = FactoryGirl.create(:user)
  quest = FactoryGirl.create(:quest)
  Engagement.create(quest: quest, user: user)
end
