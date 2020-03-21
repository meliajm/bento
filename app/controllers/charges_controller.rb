class ChargesController < ApplicationController
    
    rescue_from Stripe::CardError, with: :catch_exception

    DEFAULT_CURRENCY = 'usd'.freeze
    
    def new
        @order = Order.find(7)
    end
  
    def create
        # binding.pry
      # intialize
      new1 = initialize1(charges_params, current_user)
      #call --> create_charge
      customer = Stripe::Customer.create( email: params[:stripeEmail], source: params[:stripeToken])
      current_user.update(stripe_token: customer.id)
      customer
      create_charge(customer)
      
      redirect_to new_charge_path
    end
  
    private
  
    def charges_params
      params.permit(:stripeEmail, :stripeToken, :order_id)
    end
  
    def catch_exception(exception)
      flash[:error] = exception.message
    end


        
        def initialize1(params, user)
          @stripe_email = params[:stripeEmail]
          @stripe_token = params[:stripeToken]
          @order = params[:order_id]
          @user = user
        end
      
        def call
          create_charge(find_customer)
        end
      
        # private
      
        attr_accessor :user, :stripe_email, :stripe_token, :order
      
        def find_customer
            if user.stripe_token
                retrieve_customer(user.stripe_token)
            else
                create_customer
            end
        end
      
        def retrieve_customer(stripe_token)
          Stripe::Customer.retrieve(stripe_token) 
        end
      
        def create_customer
          customer = Stripe::Customer.create(
            email: stripe_email,
            source: stripe_token
          )
          user.update(stripe_token: customer.id)
          customer
        end
      
        def create_charge(customer)
          Stripe::Charge.create(
            customer: customer.id,
            amount: order_amount,
            description: customer.email,
            currency: DEFAULT_CURRENCY
          )
        end
      
        def order_amount
          Order.find_by(id: order).amount
        end
      

end  