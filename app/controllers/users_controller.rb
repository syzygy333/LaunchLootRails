class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @finds = Find.where(user_id: @user.id).order(
      'created_at DESC'
    )
  end
end
