Rails.application.routes.draw do
  resources :users
  resources :menu_items
  resources :bentoboxes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
