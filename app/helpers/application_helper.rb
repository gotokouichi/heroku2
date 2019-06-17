module ApplicationHelper
  
  
  
  
  
  
  
  def logged_in?
    !current_group_user.nil?
  end
end