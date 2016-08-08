class CreateIssueOwnerships < ActiveRecord::Migration
  def change
    create_table :issue_ownerships do |t|
      t.references :author, index: true
      t.references :issue, index: true

      t.timestamps null: false
      t.index [:author_id, :issue_id], unique: true
    end
  end
end
