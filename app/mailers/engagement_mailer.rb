class EngagementMailer < ApplicationMailer
  def new_engagement(engagement)
    @engagement = engagement

    mail(
      to: engagement.user.email,
      subject: "New LaunchLoot awaits!"
    )

    # show user a randomized url that takes them to find_path
    # load page that shows them the item they got
    # they aren't able to click it a second time to get more items
    # url_string =
    # @url = SecureRandom.urlsafe_base64(12)
  end
end
