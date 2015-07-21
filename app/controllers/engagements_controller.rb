class EngagementsController < ApplicationController
  def create
    @quest = Quest.find(params[:quest_id])
    @engagement = Engagement.new(
      quest_id: @quest.id, user_id: current_user.id
    )
    if @engagement.save
      duration = (@quest.end_date.day - @quest.start_date.day)
      # deliver once every 12 hours per duration
      duration.times do
        i = 1
        mail = EngagementMailer.new_engagement(@engagement)
        mail.deliver_later(wait_until: (12 * i).hours.from_now)
        i += 1
      end

      # EngagementMailer.new_engagement(@engagement).deliver_now
      flash[:success] = "You have joined the quest."
      redirect_to quests_path
    else
      flash[:alert] = @engagement.errors.full_messages.join(".  ")
      redirect_to quests_path
    end
  end

  def destroy
    @quest = Quest.find(params[:quest_id])
    @engagement = Engagement.find_by(
      quest_id: @quest.id, user_id: current_user.id
    )
    @engagement.destroy
    flash[:success] = "You have left the quest."
    redirect_to quests_path
  end

  private

  def engagement_params
    params.require(:engagement).permit(:quest_id, :user_id)
  end
end
