class AddColunsToFishingTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :fishing_trips, :title, :text
    add_column :fishing_trips, :weather, :text
    add_column :fishing_trips, :body_of_water, :text
    add_column :fishing_trips, :location, :text
    add_column :fishing_trips, :start_time, :time
    add_column :fishing_trips, :end_time, :time
    add_column :fishing_trips, :date, :date
  end
end
