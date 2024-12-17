class Public::PostCommentsController < ApplicationController
  before_action :set_post

  def create
    @post_comment = @post.post_comments.build(post_comment_params)
    @post_comment.user = current_user
   if @post_comment.save
    redirect_to @post, notice: 'コメントされました。'
   else
    Rails.logger.debug @post_comment.errors.full_messages
    puts @post_comment.errors.full_messages
    redirect_to @post, alert: 'コメント失敗しました。'
   end
  end
  
  def destroy
    @post_comment = @post.post_comments.find(params[:id])
    @post_comment.destroy
    redirect_to @post, notice: "コメントが削除されました。"
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.post_comments
  end

private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
