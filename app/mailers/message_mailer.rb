class MessageMailer < ApplicationMailer
  layout "mailer"

  def send_message
    @name = params[:message].name
    @message = params[:message].content
    @email = params[:message].email

    receiver = User.where("admin = true").first

    mail(from: "feedback@form.com", to: receiver.email, subject: 'You have a new message')
  end
end
