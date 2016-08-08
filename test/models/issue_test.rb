require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @issue_success = issues(:issue1)
    @issue_fired_time_preceded = issues(:issue2)
    @issue_start_time_preceded = issues(:issue3)
    @issue_title_too_long = issues(:issue4)
    @issue_impact_too_long = issues(:issue5)
  end
  
  test "All required properties should be present" do
    assert @issue_success.valid?
  end
  
  test "recovered_time should be precede dy fired_time" do
    assert_not @issue_fired_time_preceded.valid?
  end

  test "ending_time should be precede dy start_time" do
    assert_not @issue_start_time_preceded.valid?
  end
  
  test "title should be within maximum characters" do
    assert_not @issue_title_too_long.valid?
  end
  
  test "impact should be within maximum characters" do
    assert_not @issue_impact_too_long.valid?
  end
end
