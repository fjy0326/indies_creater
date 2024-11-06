Rails.application.routes.draw do
  devise_for :users
  get 'posts/new'
  post 'posts' => 'posts#create'
  get 'posts' => 'posts#index'
  get 'posts/edit'
  get 'posts/:id' => 'posts#show', as: 'post'
  
  get 'users/mypage'
  get 'users/edit'
  get 'users/show'
  
  get 'groups/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  get 'about' => 'homes#about'
  
end
