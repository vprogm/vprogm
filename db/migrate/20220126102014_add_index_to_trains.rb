class AddIndexToTrains < ActiveRecord::Migration[7.0]
  def change
    add_index :trains, :current_station_id
  end
end
