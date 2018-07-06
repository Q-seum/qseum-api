class Api::V1::ChargesController < ApplicationController
    skip_before_action :verify_authentication
    require 'rqrcode'

    def new
    end
    
    def create
        # Amount in cents
        @amount = params[:amount]

        customer = Stripe::Customer.create(
            :email => params[:email],
            :source  => params[:source]
        )
        
        charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => @amount,
            :description => 'Q-seum admission tickets',
            :currency    => 'usd',
            :receipt_email => params[:email]
        )
        if charge && charge.paid == true
            @ticket = Ticket.create(
                :charge_id => charge.id,
                :buyer_email => params[:email],
                :recip_email => params[:recip_email],
                :general => params[:general],
                :senior => params[:senior],
                :military => params[:military],
                :child => params[:child],
                :name => params[:name]
            )

            TicketMailer.send_ticket(@ticket).deliver_now
            render status: 201, json: @ticket
        else
            render json: { error: Stripe::CardError } 
        end
    end


    private
    def charges_params
        params.permit(:amount, :source, :receipt_email)
    end


end
