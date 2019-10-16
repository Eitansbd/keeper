class CreateFishingTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :fishing_trips do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :fishing_trips, [:user_id, :created_at]
  end
end
