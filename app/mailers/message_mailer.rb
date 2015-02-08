class MessageMailer < ActionMailer::Base

  default from: "<noreply@blogging-website.com>"
  default to: "<jerofejeva.anna@yahoo.com>"

  def new_message(message)
    @message = message
    puts @message.name
    mail subject: "Message from #{message.name}"
  end

  def new_notification()
    @users = User.where(subscribe: true)
    @users.each do |user|
      @user = user
      mail to: user.email, subject: "New post by Alexander Schechter"
    end
  end

end
