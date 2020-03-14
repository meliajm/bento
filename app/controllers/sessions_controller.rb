class SessionsController < ApplicationController
   
    def new
    end

    def create
      # not sure about this because of omniauth plus reg auth
      @user = User.create(name: params[:name], email: params[:email], password: params[:password])
      # session[:name] = request.env['omniauth.auth']['info']['name']
      # session[:omniauth_data] = request.env['omniauth.auth']
      # binding.pry
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      elsif session[:name]
        @user = User.find_by(name: session[:name])
        session[:user_id] = session[:omniauth_data]["uid"]
        redirect_to user_path(@user)
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
  