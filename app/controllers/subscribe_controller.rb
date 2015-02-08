class SubscribeController < ApplicationController

  before_filter :authenticate_user!, except: [:new, :index]

  def new
    if !user_signed_in?
      flash[:alert] = "You need to be logged in in order to subscribe!"
    end
    @posts = @posts = Post.order('created_at DESC').limit(3)
  end

  def create
    if user_signed_in?
      @user = User.find(current_user.id)
      @user.subscribe = true
      @user.save
      flash[:notice] = "SUBSCRIBED SUCCESSFULLY!"
      redirect_to '/posts'
    else
      redirect_to new_user_session_path
    end
  end

  def index
    @posts = @posts = Post.order('created_at DESC').limit(3)
  end

  def destroy
    if user_signed_in?
      @user = User.find(current_user.id)
      @user.subscribe = false
      @user.save
      flash[:notice] = "UNSUBSCRIBED SUCCESSFULLY!"
      redirect_to '/posts'
    else
      redirect_to new_user_session_path
    end
  end


end
