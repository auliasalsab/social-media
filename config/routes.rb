Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "searchs#home"
  get "/s/", to: "searchs#search"

  post "/login", to: "users#login"
  resources :users

  resources :books
  resources :likes
  resources :posts
  resources :profiles
  resources :follows
  resources :comments
end
