class Api::V1::TicketsController < ApplicationController
  skip_before_action :verify_authentication

  def create
    @ticket = Ticket.new (ticket_params)
  end

  def show
    @ticket = Ticket.find_by(params[:id])
    respond_to do |format|
      # if @ticket.paid
      #   @ticket.create
        TicketMailer.with(user: @user).send_ticket.deliver_now
      # else
      #   render json: { error "There was an error in processing" }, status:401
      # end
    end
  end

  private
  def ticket_params
    params.permit(:valid, :tickets, :recip_email, :buyer_email )
  end
end
