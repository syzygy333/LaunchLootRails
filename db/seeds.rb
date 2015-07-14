# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rarity_names = ["junk", "heirloom", "antiquity", "relic"]
values = [100, 250, 500, 1000]
change = 0

RandomWord.exclude_list << /.*_.*/
FactoryGirl.define do
  factory :item do
    name "The " + "#{RandomWord.adjs.next.capitalize} #{RandomWord.nouns.next.capitalize} of #{RandomWord.nouns.next.capitalize}"
    rarity rarity_names[change]
    value values[change]
end

2500.times do
  FactoryGirl.create(:item)
end

change = 1

1500.times do
  FactoryGirl.create(:item)
end

change = 2

750.times do
  FactoryGirl.create(:item)
end

change = 3

250.times do
  FactoryGirl.create(:item)
end
