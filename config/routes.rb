Rails.application.routes.draw do
  devise_for :users
  resources :wikis do
  resources :users, :pages, except: [:index]
  end

  
  get 'welcome/index'

  get 'welcome/wikis'


    root to: 'welcome#index'

  
end
