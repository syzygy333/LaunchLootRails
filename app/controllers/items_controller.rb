class ItemsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if params[:q] == ""
      flash[:alert] = "Please specify a search phrase"
    end
    if params[:q].present?
      @items = Item.search(params[:q])
    else
      @items = Item.order(sort_column + " " + sort_direction).page params[:page]
    end
  end

  private

  def sort_column
    Item.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
