class AddRailwayStationIdToTrains < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :trains, :current_stations
  end
end
