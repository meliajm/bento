class ChargesController < ApplicationController
    rescue_from Stripe::CardError, with: :catch_exception
    def new
      @order = Order.find(7)
    end
    
    def create
      stripe_charge = StripeChargesServices.new(charges_params, current_user).call
      # binding.pry
      flash[:notice] = "Your card has been charged #{stripe_charge[:amount]}."
      redirect_to bentoboxes_path
    end
  
    private
  
    def charges_params
      params.permit(:stripeEmail, :stripeToken, :order_id)
    end
  
    def catch_exception(exception)
      flash[:error] = exception.message
    end
  end