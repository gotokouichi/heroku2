class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_user, :logged_in?, :login_group_user, :login_member_user
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def login_group_user
    @group_user ||= GroupUser.find_by(user_id: session[:user_id])
  end

  def login_member_user 
    @member_user ||= MemberUser.find_by(user_id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  #response.headers['X-Frame-Options'] = 'ALLOWALL'
end

  