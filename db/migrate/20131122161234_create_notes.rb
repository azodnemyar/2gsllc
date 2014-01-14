class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :subject
      t.string :body
      t.integer :machine_id
      t.integer :user_id

      t.timestamps
    end
  end
end
