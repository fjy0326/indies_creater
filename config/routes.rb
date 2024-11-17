Rails.application.routes.draw do
  resources :musics
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}
  
  get 'posts/new'
  post 'posts' => 'posts#create'
  get 'posts' => 'posts#index'
  get 'posts/edit'
  get 'posts/:id' => 'posts#show', as: 'post'
  
  get 'creater/illust' => 'creater#illust'
  get 'creater/music' => 'creater#music'
  get 'creater/novel' => 'creater#novel'
  get 'creater/others' => 'creater#others'
  
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage'
  get "users/profile" => "users#show"
  get 'users/index' => 'users#index'
  resources :users, only: [:create, :edit, :update, :show]

  get 'groups/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/top', to: 'homes#top', as: 'top'
  get 'homes/about', to: 'homes#about', as: 'about'

end
