Rails.application.routes.draw do
	root to: 'posts#index'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get '/followeres', to: 'relationships#followers',as: :followers
    get '/followings', to: 'relationships#followings',as: :followings
  end
  resources :posts, only: [:show, :new, :create] do
  	resources :post_comments, only: [:create]
  	resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
