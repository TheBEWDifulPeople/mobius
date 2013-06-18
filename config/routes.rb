Mobius::Application.routes.draw do
	root "home#index"

	resources :posts do
		resources :comments, only: [:new, :show, :create]
		resources :favorites, only: [:create]
	end
	resources :categories, only: [:show]

	get "/search", to: "posts#search"
	get "profile", to: "profile#index"
	devise_for :users
end
