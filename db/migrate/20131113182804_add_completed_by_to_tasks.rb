class AddCompletedByToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completed_by, :integer
  end
end
