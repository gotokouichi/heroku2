class SessionsController < ApplicationController
  def new
  end
  
  def create
    
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.group_user.blank?
        redirect_to group_users_path, success: 'ログインに成功しました'
      else
        redirect_to member_users_path, success: 'ログインに成功しました'
      end
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
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
