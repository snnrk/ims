require 'test_helper'

class UserOperationsTest < ActionDispatch::IntegrationTest
  test "Signup" do
    get_via_redirect signup_path
    assert_response :success
    assert_template 'users/new'
    
    post_via_redirect users_path, user: {
      displayname: "new test user",
      email: "new-test@example.com",
      password: "password",
      password_confirm: "password"
    }
    assert_response :success
    assert_equal home_path, path
  end
  
  test "user can show infomation of myself" do
    get_via_redirect login_path
    assert_response :success
    
    post_via_redirect login_path, session: {
      email: users(:user1).email,
      password: "password"
    }
    assert_response :success
    
    get_via_redirect user_path(users(:user1).id)
    assert_response :success
    assert_template 'users/show'
    
    delete_via_redirect logout_path
    assert_response :success
  end
  
  test "user can show information of other user" do
    get_via_redirect login_path
    assert_response :success
    
    post_via_redirect login_path, session: {
      email: users(:user1).email,
      password: "password"
    }
    assert_response :success
    
    get_via_redirect user_path(users(:user2).id)
    assert_response :success
    assert_equal user_path(users(:user2).id), path
    assert_template 'users/show'
    
    delete_via_redirect logout_path
    assert_response :success
  end
end