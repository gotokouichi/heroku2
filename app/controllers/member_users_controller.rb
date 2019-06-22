class MemberUsersController < ApplicationController
  def index
    @member_users = MemberUser.all
  end
    
  def new
    @member_user = MemberUser.new
  end
  
  def create
    @member = MemberUser.new(member_user_params)
    @member.user_id = current_user.id
    
    if @member_user.save
      redirect_to new_member_user_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def member_user_params
    params.require(:member_user).permit(:image, :name, :gender, :prefectures, :part, :genre, :artist, :url, :description)
  end
end
