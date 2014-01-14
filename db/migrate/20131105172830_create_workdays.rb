class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.integer :employee_id
      t.datetime :date

      t.timestamps
    end
  end
end
