require 'rails_helper'

feature 'user leaves a quest', %{
  As a signed up user
  I want to leave a quest
} do

  # Acceptance criteria:
  # [X] User can join a quest

  scenario "sign in and provide valid information" do
    user = FactoryGirl.create(:user)
    quest = FactoryGirl.create(:quest)
    Engagement.create!(quest: quest, user: user)
    new_user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: new_user.email
    fill_in "Password", with: new_user.password

    click_button "Log in"

    visit quest_path(quest.id)
    click_link "Join Quest"
    visit quest_path(quest.id)

    click_link "Leave Quest"

    expect(page).to have_content("You have left the quest")
    expect(page).to have_content("Active Quests")
  end
end
