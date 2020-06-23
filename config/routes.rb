Rails.application.routes.draw do

	root "users#top"

   devise_for :users
   resources :users
   resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	get "home/about" => "users#about"
end