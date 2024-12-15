class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_genres, only: [:new, :create]

  private

  def set_genres
    @genres = Genre.all # プルダウンで表示するジャンルを取得
  end

  # Strong Parameters を追加
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :genre_id)
  end
end
  

