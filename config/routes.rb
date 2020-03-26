Rails.application.routes.draw do
  resources :users do 
    resources :orders, only: [:show, :index, :new]
  end

  resources :orders do 
    resources :charges, only: [:new, :create]
  end
  
  resources :orders
  resources :bentoboxes
  resources :menu_items#, only: [:show, :index]
  
  post '/destroy', to: 'orders#destroy'
  get '/destroy', to: 'orders#destroy'
  post '/place_order', to: 'orders#place_order'
  get '/', to: 'welcome#home', as: 'root'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#login_post'
  get '/bentoboxes/:id/total_price', to: 'bentoboxes#total_price'
  post '/orders/add_bento_to_order', to: 'orders#add_bento_to_order', as: 'add_bento'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :charges, only: [:new, :create]
end
