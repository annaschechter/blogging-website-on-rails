class MessageMailer < ActionMailer::Base

  default from: "<noreply@blogging-website.com>"
  default to: "<jerofejeva.anna@yahoo.com>"

  def new_message(message)
    @message = message
    puts @message.name
    mail subject: "Message from #{message.name}"
  end

end
