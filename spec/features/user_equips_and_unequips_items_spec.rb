require 'rails_helper'

feature 'user equips and unequips items', %{
  As a signed up user
  I want to equip and unequip items
  So my character utilizes the best gear
} do

  # Acceptance criteria:
  # [ ] User can equip and unequip items from profile page

  scenario "signed in user equips items" do
    user = FactoryGirl.create(:user)
    quest = FactoryGirl.create(:quest)
    item = Item.create(name: Faker::Lorem.sentence(1), rarity: "antiquity", value: 1000)
    Find.create!(quest_id: quest.id, user_id: user.id, item_id: item.id)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link "LaunchLoot"
    click_link "Profile"
    click_link "Equip"

    expect(page).to have_content("Item equipped")
  end

  scenario "signed in user unequips items" do
    user = FactoryGirl.create(:user)
    quest = FactoryGirl.create(:quest)
    item = Item.create(name: Faker::Lorem.sentence(1), rarity: "antiquity", value: 1000, equipped?: true)
    Find.create!(quest_id: quest.id, user_id: user.id, item_id: item.id)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link "LaunchLoot"
    click_link "Profile"
    click_link "Unequip"

    expect(page).to have_content("Item unequipped")
  end

  scenario "signed in user tries to equip more than 8 items" do
    user = FactoryGirl.create(:user)
    quest = FactoryGirl.create(:quest)
    8.times do
      item = Item.create(name: Faker::Lorem.sentence(1), rarity: "antiquity", value: 1000, equipped?: true)
      Find.create!(quest_id: quest.id, user_id: user.id, item_id: item.id)
    end
    last_item = Item.create(name: Faker::Lorem.sentence(1), rarity: "antiquity", value: 1000)
    Find.create!(quest_id: quest.id, user_id: user.id, item_id: last_item.id)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link "LaunchLoot"
    click_link "Profile"
    click_link "Equip"

    expect(page).to have_content(
      "You can only equip 8 items at a time"
    )
  end
end
