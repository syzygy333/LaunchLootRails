class EngagementMailer < ApplicationMailer
  def new_engagement(engagement, number)
    @engagement = engagement
    @url = "http://launchloot.herokuapp.com/finds/#{number}"
    mail(
      to: engagement.user.email,
      subject: "New LaunchLoot awaits!"
    )
  end
end
