class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def new
    if current_user.nil?
      redirect_to user_session_path
    else
    @post = Post.new
    @music = @post.musics.build
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.genre_id = params[:post][:genre_id]
    if params[:post][:musics].present? && params[:post][:musics][:file].present?
      @post.musics.build(music_params)
    end

   if @post.save
    redirect_to posts_path
   else
    render :new
   end
  end


  def index
    @posts = Post.all
  end
 
  def show
    if current_user.nil?
      redirect_to user_session_path
    else
    @user = @post.user
    @musics = @post.musics
    end
  end

  def edit
    if current_user.nil?
      redirect_to user_session_path
    else
    @user = @post.user
    if @post.nil?
    redirect_to posts_path, alert: "対象の投稿が見つかりませんでした。"
    end
    if @user == current_user
    else
    redirect_to posts_path
    end
    end
  end
  

  def update
    @user = @post.user
    if @post.update(post_params) 
    redirect_to @post, notice: '投稿が更新されました。'
    else
    flash[:alert] = '更新に失敗しました。'
    render :edit
    end
  end
  

  def destroy
    @user = @post.user
    @post.destroy
    redirect_to user_path(@user), notice: 'delete complete'
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body, :image, :genre_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end


  def music_params
    if params[:post][:musics].present?
      params.require(:post).permit(musics: [:file])[:musics].first || {}
    else
      {} 
    end
  end
end
