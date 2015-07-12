require 'rails_helper'

feature 'user creates a new quest', %Q{
  As a signed up user
  I want to create a quest
  So that my friends can collect items
} do
  scenario "sign in and provide valid information" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit new_quest_path

    fill_in "Title", with: "The Best Quest"
    fill_in "Description", with: "In which we go to the mountain and return with fantastic stuff"
    fill_in "Start date", with: "20150801"
    fill_in "End date", with: "20150814"

    click_button "Embark!"

    expect(page).to have_content("It shall be so.")
    expect(page).to have_content("The Best Quest")
  end

  scenario "sign in and provide invalid information" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit new_quest_path

    fill_in "Title", with: "The Best Quest"
    fill_in "Description", with: "In which we go to the mountain and return with fantastic stuff"

    click_button "Embark!"

    expect(page).to have_content("Start a Quest!")
    expect(page).to have_content("Start date can't be blank.")
  end
end
