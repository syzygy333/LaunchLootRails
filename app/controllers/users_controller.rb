class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.current_items.order('created_at DESC')
  end
end
