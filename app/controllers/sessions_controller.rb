class SessionsController < ApplicationController
   
    def new
    end

    def create
      # not sure about this because of omniauth plus reg auth
      session[:name] = request.env['omniauth.auth']['info']['name']
      session[:omniauth_data] = request.env['omniauth.auth']
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      elsif session[:name]
        @user = session[:omniauth_data]["uid"]
        redirect_to user_path(@user)
      else
          redirect_to '/'
      end
    end

    def destroy
      session.delete :user_id
      redirect_to '/'
  end
end
  