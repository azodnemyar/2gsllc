class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :serial
      t.boolean :status

      t.timestamps
    end
  end
end
