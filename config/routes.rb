Rails.application.routes.draw do


  devise_for :users
  resources :users, only: [:update]
  resources :wikis do
    resources :users, :pages, except: [:index]
    resources :pages, only: [:create, :destroy]
    resources :collaborators
  end
    
  resources :collaborators
  resources :charges, :users
  
  get 'welcome/index'

  get 'welcome/wikis'


    root to: 'welcome#index'

  
end
