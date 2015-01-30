class CommentsController < ApplicationController
before_filter :authenticate_user!

  def new
    @posts = @posts = Post.order('created_at DESC').limit(5)
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def comment_params
    puts params
    params.require(:comment).permit(:text, :user_id)
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

end
