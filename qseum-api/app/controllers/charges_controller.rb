class ChargesController < ApplicationController
    skip_before_action :verify_authentication

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

        ticket = Ticket.create(
            :buyer_email => params[:email]
            :recip_email => params[:recip_email]
            :
        )
        render json: charge


        rescue Stripe::CardError => e
        render json: e 
    end


    private
    def charges_params
        params.permit(:amount, :source, :receipt_email)
    end


end
