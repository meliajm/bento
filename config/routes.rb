Rails.application.routes.draw do
  resources :users
  resources :menu_items
  resources :bentoboxes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/bentoboxes/:id/total_price', to: 'bentoboxes#total_price'
end
