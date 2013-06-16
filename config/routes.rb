Mobius::Application.routes.draw do
	root "home#index"

	resources :posts, only: [:new, :create, :show, :destroy, :index]

	get "/search", to: "posts#search"
	get "profile", to: "profile#index"
	devise_for :users
end
