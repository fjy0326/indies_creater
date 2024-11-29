Rails.application.routes.draw do
  resources :musics
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}
  root "homes#top"
  
  get '/favicon.ico', to: redirect('/path/to/favicon.ico')
  
  get 'posts/new'
  post 'posts' => 'posts#create'
  get 'posts' => 'posts#index'
  get 'posts/edit'
  get 'posts/:id' => 'posts#show', as: 'post'
  get 'posts/:id/edit' => 'posts#edit'
  resources :posts, only: [:create, :edit, :update, :show, :destroy]
  
  get 'creater/illust' => 'creater#illust'
  get 'creater/music' => 'creater#music'
  get 'creater/novel' => 'creater#novel'
  get 'creater/others' => 'creater#others'
  
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage'
  get "users/profile" => "users#show"
  get 'users/index' => 'users#index'
  get 'users/deactivate_confirm' => 'users#deactivate'
  patch 'users/deactivate', to: 'users#deactivate', as: :deactivate_user
  resources :users, only: [:create, :edit, :update, :show]


  get 'groups/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/top', to: 'homes#top', as: 'top'
  get 'homes/about', to: 'homes#about', as: 'about'

end
