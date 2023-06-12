Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :hotels, only: [:index]
  get '/destinations/:id', to: 'destinations#show'
end
