class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def post_params
    params.require(:post).permit(:text)
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
  end 

end
