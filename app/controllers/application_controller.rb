class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  def current_member_user
    @current_member_user ||= MemberUser.find_by(id: session[:member_user_id])
  end

  def logged_in?
    !current_member_user.nil?
  end
end