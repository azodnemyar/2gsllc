class AddValueToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :value, :integer
  end
end
