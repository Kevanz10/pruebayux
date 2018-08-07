Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/reservations' => 'reservations#index'
  post '/reservations' => 'reservations#create'
  put '/reservations' => 'reservations#invoice'
end
