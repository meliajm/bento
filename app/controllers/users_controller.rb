class UsersController < ApplicationController

    def show
        if logged_in? && session[:user_id] == current_user.id
            @user = current_user
        else
            redirect_to '/'
        end
    end

    def new
        @user = User.new 
    end

    def create
       if user_params
        @user = User.create(user_params)
        session[:user_id] = @user.id
       else 
        redirect_to '/'
       end
       redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
end