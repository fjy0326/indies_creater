class Admin::DashboardsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    def index
        @users = User.all
    end
    
def delete_selected
  if params[:user_ids].present?
    User.where(id: params[:user_ids]).destroy_all
    redirect_to admin_dashboards_path, notice: '選択したユーザーを削除しました。'
  else
    redirect_to admin_dashboards_path, alert: '削除するユーザーを選択してください。'
  end
end
end
