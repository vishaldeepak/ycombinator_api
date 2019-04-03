Rails.application.routes.draw do

post '/auth/login', to: 'authentication#authenticate'

resources :posts, except: [:new]
end
