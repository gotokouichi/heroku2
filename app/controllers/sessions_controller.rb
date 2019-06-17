class SessionsController < ApplicationController
  def new
  end
  
  def create
    #binding.pry
    member_user = MemberUser.find_by(email: params[:session][:email])
    if member_user && member_user.authenticate(params[:session][:password])
      log_in member_user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
  def log_in(member_user)
    session[:member_user_id] = member_user.id
  end
  
  def log_out
    session.delete(:member_user_id)
    @current_memberuser = nil
  end
  
  def member_user_params
    params.require(:member_user).permit(:name, :email, :password, :password_confirmation)
  end
  

end
