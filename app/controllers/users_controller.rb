class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @finds = Find.where(user_id: current_user.id)
  end
end
