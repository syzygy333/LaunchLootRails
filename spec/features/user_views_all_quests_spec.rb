require 'rails_helper'

feature 'user views all quests', %{
  As a signed up user
  I want to view a list of quests
  So that I can see what others are doing
} do

  # Acceptance criteria:
  # [X] User can view a list of active quests

  scenario "view quests index page" do
    quest = FactoryGirl.create(:quest)

    visit quests_path

    expect(page).to have_content(quest.title)
    expect(page).to have_content(quest.description)
    expect(page).to have_content(quest.start_date)
    expect(page).to have_content(quest.end_date)
    expect(page).to have_content("Active Quests")
  end
end
