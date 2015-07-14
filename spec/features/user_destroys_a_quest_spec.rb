require 'rails_helper'

feature 'user destroys a quest', %{
  As a signed up user
  I want to delete a quest
} do

  # Acceptance criteria:
  # [X] User can delete a quest

  scenario "sign in and provide valid information" do
    user = FactoryGirl.create(:user)
    quest = FactoryGirl.create(:quest)
    Engagement.create!(quest: quest, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit quest_path(quest.id)

    click_link "Delete Quest"

    expect(page).to have_content("Quest destroyed")
    expect(page).to have_content("Active Quests")
  end

  scenario "don't sign in and provide valid information" do
    quest = FactoryGirl.create(:quest)

    visit quest_path(quest.id)

    click_link "Delete Quest"

    expect(page).to have_content("You may not destroy this quest")
    expect(page).to have_content(quest.title)
  end
end
