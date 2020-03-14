class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        redirect_to '/' if !session[:user_id] #this could be a problem from omniauth
    end

    def new
        @user = User.new 
    end

    def create
       if user_params
        @user = User.create(user_params)
        session[:user_id] = @user.id
        # debugger
        redirect_to user_path(@user)
       else 
        redirect_to '/'
       end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end


end
