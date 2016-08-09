class AddAssignedToIssues < ActiveRecord::Migration
  def change
    add_reference :issues, :assigned, index: true
  end
end
