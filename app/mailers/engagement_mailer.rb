class EngagementMailer < ApplicationMailer
  def new_engagement(engagement)
    @engagement = engagement

    mail(
      to: engagement.user.email,
      subject: "New LaunchLoot awaits!"
    )
  end
end
