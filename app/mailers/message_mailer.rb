class MessageMailer < ActionMailer::Base

  default from: "<noreply@schechter-capital.com>"
  # default to: "<jerofejeva.anna@yahoo.com>"

  def new_message(message)
    @message = message
    puts @message.name
    mail to: "<jerofejeva.anna@yahoo.com>", subject: "Message from #{message.name}"
  end

  def new_notification(user, post)
    @user = user
    @post = post
    mail to: user.email, subject: "New post"
  end

end
