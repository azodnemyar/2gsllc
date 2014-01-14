class CreateMachineMeta < ActiveRecord::Migration
  def change
    create_table :machine_meta do |t|
      t.string :meta_key
      t.string :meta_value
      t.integer :machine_id

      t.timestamps
    end
  end
end
