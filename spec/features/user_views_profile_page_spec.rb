require 'rails_helper'

feature 'user views profile page', %{
  As a signed up user
  I want to see my character
  So I know what items I have equipped
} do

  # Acceptance criteria:
  # [X] User can view profile page

  scenario "signed in user views profile page" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link "LaunchLoot"
    click_link "Profile"

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content("Found Items")
  end
end
