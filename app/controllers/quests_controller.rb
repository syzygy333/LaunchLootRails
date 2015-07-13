class QuestsController < ApplicationController
  def index
    @quests = Quest.all
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    if current_user == nil
      flash[:alert] = "You must be signed in to do that."
      render :new
    elsif @quest.save
      flash[:success] = "It shall be so."
      redirect_to quests_path
    else
      flash[:alert] = @quest.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @quest = Quest.find(params[:id])
  end

  private

  def quest_params
    params.require(:quest).permit(
      :title, :description, :start_date, :end_date, :user_id
    )
  end
end
