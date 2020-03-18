class SessionsController < ApplicationController
   
    def new
    end

     
    def create
      @user = User.create(name: params[:name], email: params[:email], password: params[:password]) if params[:name]
      if request.env['omniauth.auth']
        auth = request.env['omniauth.auth']
        # session[:omniauth_data] = request.env['omniauth.auth'] 
        
        @user = User.find_or_create_by(uid: auth["uid"]) do |user|
          user.name = auth["info"]["nickname"]
          user.email = auth["info"]["email"] ? auth["info"]["email"] : "#{SecureRandom.hex}@email.com"
          user.password = SecureRandom.hex
        end
        # binding.pry


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

    def login
    end

    def login_post
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to bentoboxes_path
      else
        redirect_to login_path
      end

    end

    def destroy
      session.delete :user_id 
      session.delete :omniauth_data
      # reset_session
      # binding.pry
      redirect_to '/'
    end

end
  