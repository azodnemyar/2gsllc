class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :number
      t.string :name

      t.timestamps
    end
  end
end
