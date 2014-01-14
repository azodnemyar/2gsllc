class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
      t.boolean :completed, default: false, null: false
      t.integer :user_id
      t.belongs_to :taskable, polymorphic: true

      t.timestamps
    end
    add_index :tasks, [:taskable_id, :taskable_type]
  end
end
