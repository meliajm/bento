class WelcomeController < ApplicationController
    
    def home
        @user = User.find_by(id: session[:user_id]) 
    end
    
end
  