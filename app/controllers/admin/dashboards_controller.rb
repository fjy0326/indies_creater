class Admin::DashboardsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

    def index
        @users = User.all
    end

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

    def destroy
        @user = User.find(params[:id])
     if @user.destroy
       redirect_to admin_dashboards_path, notice: 'ユーザーが削除されました'
     else
       redirect_to admin_dashboards_path, alert: '削除できませんでした'
     end
    end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end

end
