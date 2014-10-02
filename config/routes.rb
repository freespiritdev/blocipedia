Rails.application.routes.draw do
  get 'charges/new'

  get 'charges/index'

  devise_for :users
  resources :users, only: [:update]
  resources :wikis do
  resources :users, :pages, except: [:index]
    resources :pages, only: [:create, :destroy]
    resources : charges 
  end

  
  get 'welcome/index'

  get 'welcome/wikis'


    root to: 'welcome#index'

  
end
