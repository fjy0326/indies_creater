class Admin::CommentsController < ApplicationController
  
  def index
    @post_comments = PostComment.all
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_comments_path
  end
    
end
