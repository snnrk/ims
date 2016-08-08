require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:tester)
    @issue = issues(:issue1)
  end
  
  test "shoud be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.displayname = "    "
    assert_not @user.valid?
  end
  
  test "email shoud be present" do
    @user.email = nil
    assert_not @user.valid?
  end
  
  test "email shoud be in valid format" do
    @user.email = "example.com"
    assert_not @user.valid?
  end
  
  test "password should be present" do
    @user.password_digest = ""
    assert_not @user.valid?
  end
end
