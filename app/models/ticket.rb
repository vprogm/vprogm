class Ticket < ApplicationRecord
	belongs_to :user
	belongs_to :start_station, class_name: "RailwayStation", foreign_key: :start_station_id
	belongs_to :end_station, class_name: "RailwayStation", foreign_key: :end_station_id

	after_create :send_notification

	def route_name
		"#{start_station.title} - #{end_station.title}"
	end

	private

	def send_notification
		TicketsMailer.buy_ticket(self.user, self).deliver_now
	end
	
end
