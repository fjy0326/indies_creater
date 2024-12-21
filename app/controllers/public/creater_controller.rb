class Public::CreaterController < ApplicationController

  def illust
    @users = User.where(genre_id: 2)
  end

  def music
    @users = User.where(genre_id: 3)
  end

  def novel
    @users = User.where(genre_id: 1)
  end

  def others
    @users = User.where(genre_id: 4)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end


end
