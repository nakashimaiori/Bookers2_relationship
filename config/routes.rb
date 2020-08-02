Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]
  	resources :post_comments, only: [:create, :destroy]
  end
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :users, only: [:show, :edit, :update, :index]

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す


  # 微妙
  get 'follows/:id' => 'users#follows', as: 'follows'
  get 'followers/:id' =>'users#followers', as: 'followers'
  
end
