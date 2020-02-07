class MessagesController < ApplicationController
  def index
    unless current_user && current_user.admin
      redirect_to root_path and return
    end
    @messages = Message.all
  end

  def search
    unless current_user && current_user.admin
      redirect_to root_path and return
    end
    @messages = Message.admin_search params[:text]
    render :index
  end

  def new
    if current_user
      @message = Message.new(name: current_user.full_name, email: current_user.email)
    else
      @message = Message.new
    end
  end
    
  def create
    @message = Message.new(message_params)

    if @message.save
      if MessageMailer.with(message: @message).send_message.deliver_later
        redirect_to root_path, notice: 'Message sent successfully'
      else
        @message.destroy
        redirect_to root_path, notice: 'Can not send message'
      end
    else
      render :new
    end
  end

  private 

  def message_params
    params.require(:message).permit(:name, :content, :email)
  end
end