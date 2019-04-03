Rails.application.routes.draw do

post '/auth/login', to: 'authentication#authenticate'
post '/signup', to: 'users#create'

resources :posts, except: [:new]
end
