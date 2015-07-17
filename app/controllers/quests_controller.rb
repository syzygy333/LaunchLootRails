class QuestsController < ApplicationController
  def index
    @quests = Quest.order(:created_at).page params[:page]
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @engagement = Engagement.new
    if current_user == nil
      flash[:alert] = "You must be signed in to create a quest."
      render :new
    elsif @quest.save
      flash[:success] = "It shall be so."
      redirect_to quests_path
      @engagement.quest_id = @quest.id
      @engagement.user_id = current_user.id
      @engagement.save
    else
      flash[:alert] = @quest.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @quest = Quest.find(params[:id])
    @finds = Find.where(quest_id: @quest.id)
    @engagement = Engagement.find_by(user_id: current_user,
      quest_id: @quest.id)
  end

  def edit
    @quest = Quest.find(params[:id])
  end

  def update
    @quest = Quest.find(params[:id])
    if current_user && current_user == @quest.users.first
      @quest.update(quest_params)
      flash[:success] = "Quest updated."
      redirect_to quest_path(@quest)
    elsif current_user == nil || current_user != @quest.users.first
      flash[:alert] = "You may not edit this quest."
      redirect_to quest_path(@quest)
    else
      flash[:alert] = @quest.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @quest = Quest.find(params[:id])
    if current_user && current_user == @quest.users.first
      @quest.destroy
      flash[:success] = "Quest destroyed."
      redirect_to quests_path
    else
      flash[:alert] = "You may not destroy this quest."
      redirect_to quest_path(@quest)
    end
  end

  private

  def quest_params
    params.require(:quest).permit(
      :title, :description, :start_date, :end_date, :user_id
    )
  end
end
