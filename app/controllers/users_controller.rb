class UsersController < ApplicationController
before_action :load_user, only: [:show, :follow, :unfollow]

  def show
  end

  def create
    @user = User.create( user_params )
  end

  def search
    @user = User.all
  end

  def follow
    current_user.follow(@user)
    respond_to do |format|
        format.js
    end
  end

  def unfollow
    current_user.stop_following(@user)
    respond_to do |format|
        format.js
    end
  end
end

private

  def load_user
      @user = User.friendly.find(params[:id].to_s.downcase)
  end

  def user_params
    params.require(:user).permit(:avatar)
  end