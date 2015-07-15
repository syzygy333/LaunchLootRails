class FindsController < ApplicationController
  def create
    @find = Find.new(find_params)
  end

  private

  def find_params
    params.require(:find).permit(:quest_id, :item_id, :user_id)
  end
end
