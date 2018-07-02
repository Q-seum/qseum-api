class ChargesController < ApplicationController
    skip_before_action :verify_authentication

    def new
    end
    
    def create
        # Amount in cents
        @amount = params[:amount]

    
        # customer = Stripe::Customer.create(
        #     :email => params[:stripeEmail],
        #     :source  => params[:stripeToken]
        # )
    
        charge = Stripe::Charge.create(
            :source  => 'tok_visa',
            :amount      => 2000,
            :description => 'Rails Stripe customer',
            :currency    => 'usd'
        )
    
        rescue Stripe::CardError => e
        render json: e 
    end

end
