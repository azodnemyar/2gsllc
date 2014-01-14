class AddTimesheetColumnToWorkday < ActiveRecord::Migration
  def change
    add_column :workdays, :timesheet_id, :integer
  end
end
