Rails.application.routes.draw do
  post '/sign-up', to: 'registration#signup'
  post '/login', to: 'session#login'
  delete '/logout', to: 'session#logout'
end
