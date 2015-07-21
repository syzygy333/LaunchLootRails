class EngagementMailer < ApplicationMailer
  def new_engagement(engagement)
    @engagement = engagement
    find_number = rand(475) + 1
    @url = "http://launchloot.herokuapp.com/finds/#{find_number}"

    mail(
      to: engagement.user.email,
      subject: "New LaunchLoot awaits!"
    )
  end
end
