Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  
  resource :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

end
