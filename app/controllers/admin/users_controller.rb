class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!
    
   def edit
     @user = User.find_by(id: params[:id])
    if @user.nil?
     redirect_to admin_dashboards_path, alert: "User not found"
    end
   end
    
   def update
    @user.genre_id = params[:user][:genre_id]
    @user.update(user_params)
    if @user.save
    redirect_to admin_dashboards_path, notice: 'プロフィールが編集されました。'
    else
    redirect_to edit_admin_user_path(user.id), alert: '更新に失敗しました。'
    end
   end
 
   def destroy
      @user = User.find(params[:id])
     if @user.destroy
       redirect_to admin_dashboards_path, notice: 'ユーザーが削除されました'
     else
       redirect_to admin_dashboards_path, alert: '削除できませんでした'
     end
   end
    
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
