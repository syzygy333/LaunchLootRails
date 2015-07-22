require 'rails_helper'

feature 'User receives mail about new treasure', %{
  As a signed up user,
  I want to be notified when I have a new chest to open
  So that I may gain new items.
} do
  # Acceptance criteria:
  # [X] User is sent email about quest activity

  scenario "user joins an existing quest and receives email about new treasure" do
    ActionMailer::Base.deliveries.clear
    quest = FactoryGirl.create(:quest)
    4.times do
      Engagement.create!(
        quest: quest, user: FactoryGirl.create(:user)
      )
    end

    new_user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: new_user.email
    fill_in 'Password', with: new_user.password

    click_button 'Log in'

    visit quest_path(quest.id)

    click_link "Join Quest"
    expect(ActionMailer::Base.deliveries.count).to eql(5)
  end

  scenario "user creates a quest and receives email about new treasure" do
    ActionMailer::Base.deliveries.clear
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit new_quest_path

    fill_in "Title", with: "The Best Quest"
    fill_in "Description", with: "In which we go to the mountain
      and return with fantastic stuff"
    fill_in "Start date", with: "20150801"
    fill_in "End date", with: "20150814"

    click_button "Embark!"

    expect(ActionMailer::Base.deliveries.count).to eql(0)
  end
end
