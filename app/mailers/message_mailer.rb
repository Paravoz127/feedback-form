class MessageMailer < ApplicationMailer
  layout "mailer"
  
  default from: 'feedback@form.com'

  def send_message
    @name = params[:message].name
    @message = params[:message].content

    receiver = User.where("admin = true").first

    mail(from: params[:message].email, to: receiver.email, subject: 'You have a new message')
  end
end
