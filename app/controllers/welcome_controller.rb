class WelcomeController < ApplicationController
    
    def home
        @user = User.find_by(id: session[:user_id]) #|| User.create(name: session[:omniauth_data]["info"]["nickname"], email: session[:omniauth_data]["provider"], password: session[:omniauth_data]["provider"])
        # binding.pry
    end
    
end
  