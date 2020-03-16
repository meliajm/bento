class OrdersController < ApplicationController

    before_action :set_order, only: [:show, :edit, :update]

    def new
        @order = Order.new
        @user = current_user
        @bentos = Bentobox.all
        # binding.pry
    end

    def create
        @user = current_user
        # binding.pry

        @order = Order.create(order_params)
        @order.user = @user
        # binding.pry
        if @order.save
            redirect_to order_path(@order)
        else
            flash[:error] = @order.errors.full_messages
            redirect_to new_order_path #the new order is here haha
        end
    end

    def show
        @user = current_user
    end

    def edit
        @bentos = Bentobox.all
    end
    
    def update
        @order.bentoboxes.clear
        @order.save
        @order.update(order_params)
        if @order.save
            redirect_to order_path(@order)
        else
            flash[:error] = @order.errors.full_messages
            redirect_to edit_order_path
        end
    end

    private
 
    def order_params
        params.require(:order).permit(:user_id, bentobox_ids: [])
    end

    def set_order
        @order = Order.find_by(id: params[:id])
    end

end
