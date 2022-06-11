Rails.application.routes.draw do
  post '/sign-up', to: 'registration#signup'
end
