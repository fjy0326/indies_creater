class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to '/top'
  end


  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all 
    @post = Post.find(params[:id])
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end  

end
