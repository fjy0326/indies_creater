class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!
    def delete_selected
     if params[:user_ids].present?
        params[:user_ids].each do |id|
        user = User.find_by(id: id) # find_byでエラーを防止
        user&.destroy # nilチェック
     end
    redirect_to admin_dashboards_path, notice: '選択したユーザーを削除しました。'
     else
    redirect_to admin_dashboards_path, alert: '削除するユーザーを選択してください。'
     end
    end
end
