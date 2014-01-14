class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :workday_id
      t.integer :employee_id
      t.integer :timesheet_id
      t.integer :job_id
      t.datetime :date
      t.string :hours

      t.timestamps
    end
  end
end
