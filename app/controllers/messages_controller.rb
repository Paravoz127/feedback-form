class MessagesController < ApplicationController
  def index
    unless current_user && current_user.admin
      redirect_to root_path and return
    @messages = Messages.all
  end

  def search
    unless current_user && current_user.admin
      redirect_to root_path and return
    @messages = Message.admin_search params[:text]
    render :index
  end

  def new
    if current_user
      @message = Message.new(name: current_user.name, email: current_user.email)
    else
      @message = Message.new
    end
  end
    
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to root_path, notice: 'Message sent successfully'
    else
      render :new
  end
end
