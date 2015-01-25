class PostsController < ApplicationController

before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    if current_user.has_role? :admin
      @post = Post.new
    else
      redirect_to '/posts'
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def create
    if current_user.has_role? :admin
      Post.create(post_params)
      redirect_to '/posts'
    else
      redirect_to '/posts'
    end
  end

  def show
    @post = Post.find(params[:id])
  end 

  def edit
    if current_user.has_role? :admin
      @post = Post.find(params[:id])
    else
      redirect_to '/posts'
    end
  end

  def update
    if current_user.has_role? :admin
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to '/posts'
    else
      redirect_to '/posts'
    end
  end

  def destroy
    if current_user.has_role? :admin
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to '/posts'
    else
      redirect_to '/posts'
    end
  end

end
