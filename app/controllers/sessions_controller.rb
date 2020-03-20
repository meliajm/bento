class SessionsController < ApplicationController
   
    def new
    end

    def create
      @user = User.create(name: params[:name], email: params[:email], password: params[:password]) if params[:name]
      # binding.pry
      if request.env['omniauth.auth']
        auth = request.env['omniauth.auth']        
        @user = User.find_or_create_by(uid: auth["uid"]) do |user|
          user.name = auth["info"]["nickname"]
          user.email = auth["info"]["email"] ? auth["info"]["email"] : "#{SecureRandom.hex}@email.com"
          user.password = SecureRandom.hex
        end
        session[:user_id] = @user.id
        session[:bento_ids] = []
        redirect_to bentoboxes_path
      end
      
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          session[:bento_ids] = []
          redirect_to bentoboxes_path
      else
          # redirect_to '/'
      end
      # redirect_to bentoboxes_path
    end

    def login
    end

    def login_post
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to bentoboxes_path
      else
        flash[:error] = @user.errors.full_messages
        redirect_to login_path
      end

    end

    def destroy
      session.delete :user_id 
      redirect_to '/'
    end

end
  