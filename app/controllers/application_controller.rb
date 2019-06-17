class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_member_user, :logged_in?
  
  def current_member_user
    @current_member_user ||= MemberUser.find_by(id: session[:member_user_id])
  end

  def logged_in?
    !current_member_user.nil?
  end
end

  