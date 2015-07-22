class FindsController < ApplicationController
  def show
    @find = Find.find_by(id: params[:id])
  end

  private

  def find_params
    params.require(:find).permit(:quest_id, :item_id, :user_id)
  end
end
