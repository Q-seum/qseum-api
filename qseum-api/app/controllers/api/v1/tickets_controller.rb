class Api::V1::TicketsController < ApplicationController
  skip_before_action :verify_authentication


  def show
    @ticket = Ticket.find_by(params[:id])
    if !@ticket.redeemed
      render "api/v1/tickets/show.json", status:200
    else
      render json: { error: "This ticket has already been used." }
    end
  end

  private
  def ticket_params
    params.permit(:redeemed, :tickets, :recip_email, :buyer_email )
  end

end
