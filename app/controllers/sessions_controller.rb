class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = MemberUser.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  private
  def log_in(user)
    session[:member_user_id] = member_user_id
  end
end
