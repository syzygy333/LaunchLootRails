class EngagementsController < ApplicationController
  # def index
  #   @engagements = Engagement.all
  # end
  #
  def create
    @quest = Quest.find(params[:quest_id])
    @engagement = Engagement.new(
      quest_id: @quest.id, user_id: current_user.id
    )
    if @engagement.save
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
