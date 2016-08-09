require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user1)
    @user_without_displayname = users(:user2)
    @user_without_email = users(:user3)
    @user_with_invalid_email = users(:user4)
    @user_without_password = users(:user5)
  end
  
  test "all required properties shoud be present" do
    assert @user.valid?
  end
  
  test "displayname should be present" do
    assert_not @user_without_displayname.valid?    
  end
  
  test "email should be present" do
    assert_not @user_without_email.valid?
  end

  test "email should be with valid format" do
    assert_not @user_with_invalid_email.valid?
  end
  
  test "password should be present" do
    assert_not @user_without_password.valid?
  end
  
  test "written_issues should be counted" do
    assert @user.written_issues.count > 0
  end
  
  test "assigned_issues should be counted" do
    assert @user.assigned_issues.count > 0
  end
end
