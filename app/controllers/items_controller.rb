class ItemsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @items = Item.order(sort_column + " " + sort_direction).page params[:page]
  end

  def update
    @item = Item.find(params[:id])
    @equipped_item_count = 0
    current_user.current_items.each do |item|
      if item.equipped?
        @equipped_item_count += 1
      end
    end
    if current_user && current_user.current_items.include?(@item)
      if @item.equipped? == true
        @item.update(equipped?: false)
        redirect_to user_path(current_user.id)
      elsif (@item.equipped? == false) && (@equipped_item_count < 8)
        @item.update(equipped?: true)
        flash[:success] = "Item equipped."
        redirect_to user_path(current_user.id)
      else
        flash[:alert] = "You can only equip 8 items at a time."
        redirect_to user_path(current_user.id)
      end
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
