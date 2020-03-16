class OrdersController < ApplicationController

    def new
        @order = Order.new
        @user = current_user
    end

    def create
        @order = Order.create(order_params)
        # binding.pry
        if @order.save
            redirect_to order_path(@order)
        else
            flash[:error] = @order.errors.full_messages
            redirect_to new_order_path #the new order is here haha
        end
    end

    def show
        @order = Order.find_by(id: params[:id])
        @user = current_user
    end

    def edit
    end
    
    def update
    end

    private
 
    def order_params
        params.require(:order).permit(:user_id, bentobox_ids: [])
        # params.require(:bentobox).permit(:name, :bento_type, menu_item_ids: [])

    end

end
