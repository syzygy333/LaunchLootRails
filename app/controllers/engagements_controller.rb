class EngagementsController < ApplicationController
  def random_item
    Item.all.sample
  end

  def create
    @quest = Quest.find(params[:quest_id])
    @engagement = Engagement.new(
      quest_id: @quest.id, user_id: current_user.id
    )
    if @engagement.save
      if @quest.users.count % 5 == 0
        @quest.users.each do |user|
          engagement = Engagement.find_by(
            user_id: user.id, quest_id: @quest.id
          )
          item_roller = random_item
          Find.create!(
            quest_id: @quest.id, item_id: item_roller.id,
            user_id: user.id
          )
          EngagementMailer.new_engagement(
            engagement, item_roller
          ).deliver_later
        end
      end
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
