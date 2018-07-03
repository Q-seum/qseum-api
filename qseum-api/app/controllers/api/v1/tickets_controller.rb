class Api::V1::TicketsController < ApplicationController
  skip_before_action :verify_authentication

  def create
    @ticket = Ticket.create (ticket_params)
  end

  def show
    @ticket = Ticket.find_by(params[:id])
    respond_to do |format|
        TicketMailer.with(user: @user).send_ticket.deliver_now
    end
  end

  private
  def ticket_params
    params.permit(:redeemed, :tickets, :recip_email, :buyer_email )
  end
end
