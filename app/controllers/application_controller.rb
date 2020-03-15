class ApplicationController < ActionController::Base

  private 

  def current_user
    # binding.pry
    User.find(session[:user_id]) 
    # || User.create(session[:omniauth_data]["uid"])
  end

end
