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
        binding.pry
        charge = Stripe::Charge.create(
            :source  => params[:source],
            :amount      => @amount,
            :description => 'Rails Stripe customer',
            :currency    => 'usd'
        )
        render json: charge
        rescue Stripe::CardError => e
        render json: e 
    end


    private
    def charges_params
        params.permit(:amount, :source)
    end


end
