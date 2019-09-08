Rails.application.routes.draw do
  devise_for :users
	root to: "home#index"

	get 'home/index'
	get 'contacts' => 'contacts#new'
	get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'
  resource :contacts, only: [:new, :create],path_names: {:new => ''}
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	resources :articles do 
		resources :comments
	end
end
