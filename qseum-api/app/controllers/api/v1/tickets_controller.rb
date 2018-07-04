class Api::V1::TicketsController < ApplicationController
  skip_before_action :verify_authentication


  def show
    @ticket = Ticket.find_by(params[:id])
  end

  private
  def ticket_params
    params.permit(:redeemed, :tickets, :recip_email, :buyer_email )
  end

end
