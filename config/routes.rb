Rails.application.routes.draw do
  resources :chat_rooms, only: [:index, :show, :create], param: :topic
  get '/test', to: 'test#index'

  post '/sign-up', to: 'registration#signup'
  post '/login', to: 'session#login'
end
