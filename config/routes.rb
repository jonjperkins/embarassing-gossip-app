Rails.application.routes.draw do
  root 'posts#index'
  get 'create' => 'posts#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :posts

  
  
  
 
end