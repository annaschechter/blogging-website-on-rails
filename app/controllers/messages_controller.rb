class MessagesController < ApplicationController

  def new
    @message = Message.new
    @posts = @posts = Post.order('created_at DESC').limit(3)
  end

  def create
    @posts = @posts = Post.order('created_at DESC').limit(3)
    @message = Message.new(message_params)
    puts "Contrller"+ @message.name
    
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message. Please make sure that you fill in all the required fields."
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end

end
