class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.datetime :fired_time
      t.datetime :recovered_time
      t.datetime :start_time
      t.datetime :ending_time
      t.string :impact
      t.references :author, index: true

      t.timestamps null: false
    end
  end
end
