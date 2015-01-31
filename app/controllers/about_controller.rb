class AboutController < ApplicationController

  def index
    @posts = @posts = Post.order('created_at DESC').limit(3)
  end
  
end
