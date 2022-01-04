Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      get '/users', to: 'users#index'
      post '/signup', to: 'users#signup'
      post '/login', to: 'sessions#login'
      get '/books', to: 'books#index'
    end
  end
end
