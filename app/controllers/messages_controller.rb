class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    @message.from_user_id = current_user.id
    #binding.pry

    if @message.save
      redirect_to users_messages_path(to_user_id: @message.to_user_id), success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
    # @user = User.find_by(id: current_user.id)
  #   @user.topics
  #   @messages = Message.where("from_user_id = ? OR ?) AND (to_user = ? OR?"), current_user.id, @to_user.id,current_user.id,@to_user.id
  end
  
  private
  def message_params
    params.require(:message).permit(:content, :to_user_id)
  end
end
