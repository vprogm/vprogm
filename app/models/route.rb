class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :stations_count 

  before_validation	 :set_name

  private

  def set_name
    if railway_stations.size > 0
  	self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
    else
    end
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Маршрут должен содержать минимум 2 станции")
    end
  end
end