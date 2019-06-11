require 'test_helper'

class MemberUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get member_users_new_url
    assert_response :success
  end

end
