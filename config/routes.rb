Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "searchs#home"

  post "/login", to: "users#login"
  post "/token", to: "refres_tokens#token"
  resources :users
  resources :books
  resources :posts

end
