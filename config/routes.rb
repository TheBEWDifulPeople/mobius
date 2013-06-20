Mobius::Application.routes.draw do
	root "home#index"

	resources :posts do
		resources :comments, only: [:new, :show, :create]
		resources :favorites, only: [:create]
	end
	resources :categories, only: [:show]
	resources :profiles, only: [:show]

  get "/about", to: "static#about"
	get "/search", to: "posts#search"
	get "/categories/posts/:id", to: "posts#show"
	get "/profiles/posts/:id", to: "posts#show"
	devise_for :users
end