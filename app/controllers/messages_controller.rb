class MessagesController < ApplicationController
  def new
    @messages = Message.new
  end
  
  
  def create
    @user = User.find_by(id: current_user.id)
    @user.topics
    @messages = Message.where("from_user_id = ? OR ?) AND (to_user = ? OR?"), current_user.id, @to_user.id,current_user.id,@to_user.id
  end
end
