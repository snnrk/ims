require 'test_helper'

class IssueOperationsTest < ActionDispatch::IntegrationTest
  test "user can display, edit and delete issues" do
    get_via_redirect login_path
    assert_response :success
    
    post_via_redirect login_path, session: {
      email: users(:user1).email,
      password: "password"
    }
    assert_response :success
    
    get_via_redirect issue_path(issues(:issue1).id)
    assert_response :success
    assert_template 'issues/show'
    
    get_via_redirect edit_issue_path(issues(:issue1).id)
    assert_response :success
    assert_template 'issues/edit'
    
    put_via_redirect issue_path(issues(:issue1).id), issue: {
      title: "Touble1!",
    }
    assert_response :success
    assert_template 'issues/show'
    
    delete_via_redirect issue_path(issues(:issue1).id)
    assert_response :success
    assert_template 'issues/index'

    delete_via_redirect logout_path
    assert_response :success
  end

  test "user can create issues and assigned user to issues" do
    get_via_redirect login_path
    assert_response :success
    
    post_via_redirect login_path, session: {
      email: users(:user1).email,
      password: "password"
    }
    assert_response :success
    
    get_via_redirect new_issue_path
    assert_response :success
    assert_template 'issues/new'
    
    post_via_redirect issues_path, issue: {
      title: "new Touble",
      fired_time: "2016-01-01 00:00:00",
      recovered_time: "2016-01-01 00:30:00",
      start_time: "2016-01-01 00:05:00",
      ending_time: "2016-01-01 00:35:00",
      impact: "Site"
    }
    assert_response :success
    assert_template 'issues/show'
    
    delete_via_redirect issue_path(issues(:issue1).id)
    assert_response :success
    assert_template 'issues/index'

    delete_via_redirect logout_path
    assert_response :success
  end
end