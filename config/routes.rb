Mobius::Application.routes.draw do
	root "home#index"

	resources :posts, only: [:new, :create, :show, :destroy, :index] do
		resources :comments, only: [:new, :show, :create]
	end

	get "/search", to: "posts#search"
	get "profile", to: "profile#index"
	devise_for :users
end
