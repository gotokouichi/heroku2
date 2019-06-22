class GroupUsersController < ApplicationController
  def index
    @group_users = GroupUser.all
  end
    
  def new
    binding.pry
    @group_user = GroupUser.new
  end
  
  def create
    
    @group_user = GroupUser.new(group_user_params)
    @group_user.user_id = current_user.id
    
    if @group_user.save
      log_in @user
      redirect_to new_group_user_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def group_user_params
    params.require(:group_user).permit(:image, :name, :gender, :prefectures, :part, :genre, :artist, :url, :description)
  end
end
