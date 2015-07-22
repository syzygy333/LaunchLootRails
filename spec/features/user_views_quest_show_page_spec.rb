require 'rails_helper'

feature 'user views a specific quest', %{
  As a signed up user
  I want to view a specific quest
  So that I can see what others are doing
} do

  # Acceptance criteria:
  # [X] User can view a specific quest page

  scenario "view quests show page" do
    user = FactoryGirl.create(:user)
    quest = FactoryGirl.create(:quest)
    Engagement.create(quest_id: quest.id, user_id: user.id)

    visit quest_path(quest.id)

    expect(page).to have_content(quest.title)
    expect(page).to have_content(quest.description)
    expect(page).to have_content(quest.start_date)
    expect(page).to have_content(quest.end_date)
    expect(page).to have_content(quest.users.first.first_name)
    expect(page).to_not have_content("Active Quests")
  end
end
