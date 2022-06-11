Rails.application.routes.draw do
  #from tutorial
  root 'games#index'
  resources :games do
    resources :moves, only: [:create]
  end
  
end