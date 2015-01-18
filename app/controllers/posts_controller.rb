class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    authenticate_user!
    if current_user.has_role? :admin
      @post = Post.new
    else
      redirect_to '/posts'
    end
  end

  def post_params
    params.require(:post).permit(:text)
  end

  def create
    authenticate_user!
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
    authenticate_user!
    if current_user.has_role? :admin
      @post = Post.find(params[:id])
    else
      redirect_to '/posts'
    end
  end

  def update
    authenticate_user!
    if current_user.has_role? :admin
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to '/posts'
    else
      redirect_to '/posts'
    end
  end

  def destroy
    authenticate_user!
    if current_user.has_role? :admin
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to '/posts'
    else
      redirect_to '/posts'
    end
  end

end
