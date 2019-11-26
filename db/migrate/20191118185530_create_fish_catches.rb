class CreateFishCatches < ActiveRecord::Migration[5.0]
  def change
    create_table :fish_catches do |t|
      t.integer :weight
      t.integer :length
      t.references :fish_type, foreign_key: true
      t.references :fishing_trip, foreign_key: true

      t.timestamps
    end
  end
end
