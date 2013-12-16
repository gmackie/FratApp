SampleApp::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,    only: [:create, :destroy] do
      resources :comments,      only: [:create, :destroy]
  end
  resources :comments,      only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :groups
  root to: 'static_pages#home'
  match '/newgroup',  to: 'groups#new',           via: 'get'
  match '/joingroup', to: 'groups#addUser',       via: 'get'
  match '/help',      to: 'static_pages#help',    via: 'get'
  match '/about',     to: 'static_pages#about',   via: 'get'
  match '/contact',   to: 'static_pages#contact', via: 'get'
end
