class Public::UsersController < ApplicationController
before_action :set_user, only: [:mypage, :edit, :show, :update, :destroy]
before_action :authenticate_user!

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
    unless  @user.id == current_user.id
      redirect_to mypage_path(current_user.id)
    end  
  end

  def show
    @posts = @user.posts
  end
  
  
  def index
    @users = User.all
    render :index
  end
  

  def update
    @user.genre_id = params[:user][:genre_id]
    @user.update(user_params)
    if @user.save
    redirect_to user_path(@user.id), notice: 'プロフィールが編集されました。'
    else
    redirect_to edit_user_path(@user.id), alert: '更新に失敗しました。'
    end
  end

  def destroy
  end
  
  def deactivate_confirm
  end
  
  def deactivate
    @user = current_user
    if @user.update(is_active: false) # 会員ステータスをfalseに更新
      reset_session # セッションをリセットしてログアウト
      flash[:notice] = "退会処理が完了しました。"
      redirect_to top_path # トップページにリダイレクト
    else
      flash[:alert] = "退会処理に失敗しました。"
      render :edit # 必要に応じて再編集画面を表示
    end
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile, :genre_id)
  end

  
end
