class ItemsController < ApplicationController
  def index
    @items = Item.order(:name).page params[:page]
  end
end
