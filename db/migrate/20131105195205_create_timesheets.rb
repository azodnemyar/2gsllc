class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :employee_id
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
  end
end
