class EngagementMailer < ApplicationMailer
  def new_engagement(engagement, number)
    @engagement = engagement
    @url = "http://localhost:3000/finds/#{number}"
    mail(
      to: engagement.user.email,
      subject: "New LaunchLoot awaits!"
    )
  end
end
