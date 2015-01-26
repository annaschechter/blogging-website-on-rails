class HomeController < ApplicationController

  def index
    @post = Post.last
    @posts = @posts = Post.order('created_at DESC').limit(5)
  end
end
