Rails.application.routes.draw do

devise_for :admin, skip: [:registrations, :password], controllers: {
  sessions: 'admin/sessions'
}

namespace :admin do
  get 'dashboards', to: 'dashboards#index'
  get 'users/edit' => 'users#edit'
  get 'comments' => 'comments#index'
  
  get 'dashboards/illust' => 'dashboards#illust'
  get 'dashboards/music' => 'dashboards#music'
  get 'dashboards/novel' => 'dashboards#novel'
  get 'dashboards/others' => 'dashboards#others'

  resources :comments, only: [:index, :destroy]
  resources :users, only: [:edit, :update, :destroy] do
    delete :delete_selected, on: :collection # コレクションルートとして定義
  end
 end

scope module: :public do
  resources :musics
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}
  root "homes#top"

  get '/favicon.ico', to: redirect('/path/to/favicon.ico')

  get "search" => "searches#search"
  get "searches/index" => "searches#index"

  get 'posts/new'
  post 'posts' => 'posts#create'
  get 'posts' => 'posts#index'
  get 'posts/edit'
  get 'posts/:id' => 'posts#show', as: 'post'
  get 'posts/:id/edit' => 'posts#edit'
  resources :posts, only: [:create, :edit, :update, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:index, :create, :destroy]
  end

  get 'creater/illust' => 'creater#illust'
  get 'creater/music' => 'creater#music'
  get 'creater/novel' => 'creater#novel'
  get 'creater/others' => 'creater#others'

  get 'users/:id/mypage' => 'users#mypage', as: 'mypage'
  get "users/profile" => "users#show"
  get 'users/index' => 'users#index'
  get 'users/deactivate' => 'users#deactivate_confirm'
  patch 'users/deactivate', to: 'users#deactivate', as: :deactivate_user
  resources :users, only: [:create, :edit, :update, :show]


  get 'groups/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/top', to: 'homes#top', as: 'top'
  get 'homes/about', to: 'homes#about', as: 'about'
end

end
