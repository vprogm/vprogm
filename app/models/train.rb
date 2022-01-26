class Train < ApplicationRecord
    has_many :carriages 

	validates :number, presence: true

	belongs_to :current_stations, class_name: 'RailwayStation', foreign_key: :current_stations_id
end
