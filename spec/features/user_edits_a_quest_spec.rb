require 'rails_helper'

feature 'user edits a quest', %{
  As a signed up user
  I want to edit a quest
  So that it has the correct information
} do
  scenario "sign in and provide valid information" do
    user = FactoryGirl.create(:user)
    quest = FactoryGirl.create(:quest)
    engagement = Engagement.create!(quest: quest, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit edit_quest_path(quest.id)

    fill_in "Title", with: "Quest #2"
    fill_in "Description", with: "Description for Quest #2"

    click_button "Change it!"

    expect(page).to have_content("Quest updated.")
    expect(page).not_to have_content("Edit your Quest!")
  end

  scenario "sign in and provide invalid information" do
    user = FactoryGirl.create(:user)
    quest = FactoryGirl.create(:quest)
    engagement = Engagement.create!(quest: quest, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit edit_quest_path(quest.id)

    fill_in "Title", with: ""
    fill_in "Description", with: "Description for Quest #2"
    fill_in "End date", with: "20150814"

    click_button "Change it!"

    expect(page).to have_content(quest.title)
    expect(page).not_to have_content("Edit your Quest!")
  end

  scenario "don't sign in and provide valid information" do
    quest = FactoryGirl.create(:quest)

    visit edit_quest_path(quest.id)

    fill_in "Title", with: "Quest #2"
    fill_in "Description", with: "Description for Quest #2"
    fill_in "End date", with: "20150814"

    click_button "Change it!"

    expect(page).to have_content("You may not edit this quest")
    expect(page).not_to have_content("Edit your Quest!")
  end
end
