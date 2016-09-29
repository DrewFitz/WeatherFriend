Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#hello'

  get  '/hello', to: 'users#hello'
  post '/login', to: 'users#login'
  get  '/new/:name', to: 'users#new'
  post '/create/:name', to: 'users#create'
  get  '/:name', to: 'users#show'
  post '/:name/add_location', to: 'users#add_location'
  get  '/:name/:location', to: 'users#forecast'
  delete '/:name/:location', to: 'users#remove_location'

end
