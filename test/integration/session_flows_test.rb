require 'test_helper'

class SessionFlowsTest < ActionDispatch::IntegrationTest
  test "login and browse site and logout" do
    get login_path
    assert_response :success
    
    post_via_redirect login_path, session: {
      email: users(:user1).email,
      password: "password"
    }
    assert_equal home_path, path
    
    delete_via_redirect logout_path
    assert_equal root_path, path
  end
  
  test "login is required to show issues" do
    open_session
    get_via_redirect issues_path
    assert_equal login_path, path
  end
  
  test "login is required to show user" do
    open_session
    get_via_redirect user_path(users(:user1).id)
    assert_equal login_path, path
  end
end