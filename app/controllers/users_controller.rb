class UsersController < ApplicationController
before_action :set_user, only: [:mypage]

  def set_user
    @user = User.find(params[:id])
  end

  def mypage
   if @user == current_user
     @posts = @user.posts
     render :mypage
   else
    redirect_to top_path
   end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
  
  def index
    @users = User.all
    render :index
  end
  

  def update
    @user = User.find(params[:id])
    @user.genre_id = params[:user][:genre_id]
    @user.update(user_params)
    if @user.save
    redirect_to user_path(@user.id)
    else
    redirect_to edit_user_path(@user.id)
   end
  end

  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end

  
end
