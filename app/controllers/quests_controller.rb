class QuestsController < ApplicationController
  def index
    @quests = Quest.all
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.user = current_user
    if @quest.save
      flash[:success] = "It shall be so."
      redirect_to quests_path
    else
      flash[:alert] = @spot.errors.full_messages.join(".  ")
      render :new
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:title, :description, :start_date, :end_date, :user_id)
  end
end
