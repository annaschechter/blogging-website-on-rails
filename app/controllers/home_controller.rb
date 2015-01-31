class HomeController < ApplicationController

  def index
    @post = Post.last
    @posts = Post.order('created_at DESC').limit(4)
  end
end
