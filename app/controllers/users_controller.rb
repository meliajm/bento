class UsersController < ApplicationController

    def show
        # binding.pry
        # if !session[:omniauth_data]
        
        # binding.pry
        if logged_in? && session[:user_id] == current_user.id

            @user = current_user
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
            # redirect_to '/' if !session[:user_id] #this could be a problem from omniauth
        # else
        #     redirect_to '/'
    end

    def new
        @user = User.new 
    end

    def create
       if user_params
        @user = User.create(user_params)
        session[:user_id] = @user.id
        # redirect_to user_path(@user)
        redirect_to '/'
       else 
        redirect_to '/'
       end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :email)
    end


end
