require 'rails_helper'

feature 'User receives mail about new treasure', %{
  As a signed up user,
  I want to be notified when I have a new chest to open
  So that I may gain new items.
} do
  # Acceptance criteria:
  # [ ] User is sent email about quest activity

  scenario "receive email about new treasure" do
    ActionMailer::Base.deliveries.clear
    user = FactoryGirl.create(:user)
    quest = FactoryGirl.create(:quest)
    engagement = Engagement.create(quest_id: quest.id, user_id: user.id)
    binding.pry

    expect(ActionMailer::Base.deliveries.count).to eql(1)
  end
end
