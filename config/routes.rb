Rails.application.routes.draw do
  get '/test', to: 'test#index'

  post '/sign-up', to: 'registration#signup'
  post '/login', to: 'session#login'
  delete '/logout', to: 'session#logout'
end
