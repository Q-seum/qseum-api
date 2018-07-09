class Api::V1::ChargesController < ApplicationController
    skip_before_action :verify_authentication
    require 'rqrcode'
    include MakeTicket

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
            @ticket = new_ticket(charge)
            email_ticket(@ticket)
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
