class ChangeWeightAndLengthToNumerical < ActiveRecord::Migration[5.0]
  def change
    change_column :fish_catches, :weight, :decimal, precision: 6, scale: 2
    change_column :fish_catches, :length, :decimal, precision: 6, scale: 2
  end
end
