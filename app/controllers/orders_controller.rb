class OrdersController < ApplicationController

    before_action :set_order, only: [:show, :edit, :update, :destroy, :place_order]
    def add_bento_to_order 
        session[:bento_ids] << params[:bento_id] unless session[:bento_ids].include?(params[:bento_id]) 
        redirect_to new_order_path   
    end

    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
            if @user.nil?
                redirect_to '/', alert: "User not found" 
            else
                @orders = @user.orders 
            end
        else
            redirect_to '/', alert: "You are not logged in but shouldn't be able to see this anyways"
            # @orders = Order.all
        end
    end

    def new
        @order = Order.new(bentobox_ids: session[:bento_ids])
        # binding.pry
        @user = current_user
        @bentos = Bentobox.all
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
        if session[:user_id]
            @user = current_user
            @order = @user.orders.find_by(id: params[:id])
            redirect_to user_orders_path(@user), alert: "Order not found" if @order.nil?
        else
            @order = Order.find_by(id: params[:id])
        end 
    end

    def edit
        @bentos = Bentobox.all
        # if current_user != @order.user
        #     redirect_to bentobox_path
        # end
        # binding.pry
        if current_user != @order.user
            redirect_to orders_path  
        end
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

    def place_order
        # @user = current_user
        # @orders = current_user.orders
        flash[:notice] = "Order Placed"
        redirect_to root_path
        # add route as post
    end

    def destroy
        @order.destroy
        flash[:notice] = "Order Deleted"
        redirect_to orders_path
    end


    private
 
    def order_params
        params.require(:order).permit(:user_id, :pickup_deliver, bentobox_ids: [])
    end

    def set_order
        @order = Order.find_by(id: params[:id])
    end

end
