class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.references :user, foreign_key: true
      t.datetime :interview_datetime
      t.integer :approval_status

      t.timestamps
    end
  end
end
