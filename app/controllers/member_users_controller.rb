class MemberUsersController < ApplicationController
  def new
    @member_user = MemberUser.new
  end
  
  def create
     #binding.pry
    @member_user = MemberUser.new(name: params[:member_user][:name], email: params[:member_user][:email])
    if @member_user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def member_user_params
    params.require(:member_user).permit(:name, :email, :password, :password_confirmation)
  end
end
