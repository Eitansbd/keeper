class AddWorldRecordToFishType < ActiveRecord::Migration[5.0]
  def change
    add_column :fish_types, :record_length, :decimal, precision: 6, scale: 2
    add_column :fish_types, :record_weight, :decimal, precision: 6, scale: 2
  end
end
