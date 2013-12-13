SampleApp::Application.routes.draw do
  get "comments/create"
  get "comments/destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy] do
      resources :comments,      only: [:create, :destroy]
  end
  resources :comments,      only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :groups
  root to: 'static_pages#home'
  match '/newgroup',  to: 'groups#new',           via: 'get'
  match '/joingroup', to: 'groups#addUser',       via: 'get'
  match '/signup',    to: 'users#new',            via: 'get'
  match '/signin',    to: 'sessions#new',         via: 'get'
  match '/signout',   to: 'sessions#destroy',     via: 'delete'
  match '/help',      to: 'static_pages#help',    via: 'get'
  match '/about',     to: 'static_pages#about',   via: 'get'
  match '/contact',   to: 'static_pages#contact', via: 'get'
end
