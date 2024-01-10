Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, only: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :prototypes
  # Defines the root path route ("/")
  # root "articles#index"
  get '/style.css', to: redirect('/assets/style.css')
  resources :prototypes do
    resources :comments, only: [:create, :destroy]
  end
end
