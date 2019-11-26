class CreateFishTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :fish_types do |t|
      t.text :name

      t.timestamps
    end
  end
end
