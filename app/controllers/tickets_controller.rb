class TicketsController < ApplicationController
	before_action :authenticate_user!, only: :created

	def show
		@ticket = Ticket.find(params[:id])
	end

	def create
		@ticket = current_user.ticket.new # (ticket_params)

		if @ticket.save
			redirect_to @ticket
		else
			redirect_to search_path
		end
	end
end
