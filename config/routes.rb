Rails.application.routes.draw do
  devise_for :users
  
  get 'posts/new'
  post 'posts' => 'posts#create'
  get 'posts' => 'posts#index'
  get 'posts/edit'
  get 'posts/:id' => 'posts#show', as: 'post'
  
  
  get 'users/mypage'
  resources :users, only: [:create, :edit, :update, :show]

  get 'groups/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/top', to: 'homes#top', as: 'top'
  get 'homes/about', to: 'homes#about', as: 'about'
  
end
