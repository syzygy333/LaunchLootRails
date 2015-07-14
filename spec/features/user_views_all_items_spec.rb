require 'rails_helper'

feature 'user views all items', %{
  As a signed up user
  I want to view a list of items
  So that I can see what is available
} do

  # Acceptance criteria:
  # [ ] User can view a list of all items

  scenario "view items index page" do
    item = Item.create!(name: "#{RandomWord.adjs.next} #{RandomWord.nouns.next} of #{RandomWord.nouns.next}".titleize, rarity: "heirloom", value: 250)

    visit items_path

    expect(page).to have_content(item.name)
    expect(page).to have_content("Heirloom")
    expect(page).to have_content(item.value)
    expect(page).to have_content("All the Items")
  end
end
