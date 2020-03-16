class SessionsController < ApplicationController
   
    def new
    end

    #questions on omniauth for validations conditionals for if user logs in via reg way or github
     
    def create
      # not sure about this because of omniauth plus reg auth
      #save user who logs in through github to database?
      # binding.pry
      @user = User.create(name: params[:name], email: params[:email], password: params[:password]) if params[:name]
      if request.env['omniauth.auth']
        session[:name] = request.env['omniauth.auth']['info']['name'] 
        session[:omniauth_data] = request.env['omniauth.auth'] 
        @user = User.find_or_create_by(name: session[:omniauth_data]["info"]["nickname"], email: session[:omniauth_data]["provider"])         
        session[:user_id] = @user.id
        # session[:user_id] = session[:omniauth_data]["uid"]
      end
      # binding.pry
      
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          # redirect_to user_path(@user)
      # elsif session[:name]
      #   @user = User.create(name: session[:name], email: session[:email])
      #   session[:user_id] = session[:omniauth_data]["uid"]
      #   redirect_to user_path(@user)
      else
          redirect_to '/'
      end
    end

    def destroy
      session.delete :user_id 
      session.delete :omniauth_data

      redirect_to '/'
  end
end
  