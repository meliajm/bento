class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        # binding.pry
        User.find(session[:user_id]) #|| User.create(session[:omniauth_data]["uid"])
    end

    def logged_in?
        !!session[:user_id]
    end

end
