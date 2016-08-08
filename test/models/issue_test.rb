require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @issue_success = issues(:issue1)
    @issue_invalid_author_id = issues(:issue2)
  end
  
  test "..." do
    assert @issue_success.valid?
  end
  
  test "..." do
    assert_not @issue_invalid_author_id.valid?
  end
end
