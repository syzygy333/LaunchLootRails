class FindsController < ApplicationController
  def create
    @find = Find.create(find_params)
  end

  def show
    # if the find already exists, show it
    if @find = Find.find_by(id: params[:id]) != nil
      @find = Find.find_by(id: params[:id])
    else
      # if it doesn't exits, create one
      @find = Find.create(find_params)
    end
  end

  private

  def find_params
    params.require(:find).permit(:quest_id, :item_id, :user_id)
  end
end
