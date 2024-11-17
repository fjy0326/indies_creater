class PostsController < ApplicationController
  def new
    @post = Post.new
    @music = @post.musics.build
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
    @posts = Post.all
    @post = Post.find(params[:id])
    @musics = @post.musics
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image, :genre_id)
  end

end

  def music_params
    if params[:post][:musics].present?
      params.require(:post).permit(musics: [:file])[:musics].first || {}
    else
      {} 
    end
  end