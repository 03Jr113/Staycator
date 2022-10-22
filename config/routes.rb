Rails.application.routes.draw do

  root to: 'users/homes#top'
  get 'about' => 'users/homes#about'
  get 'search', to: 'users/searches#search'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  }

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :destroy]
    resources :tags, only: [:index, :destroy]
    resources :items, only: [:index, :destroy]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: 'users' do
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
    end
    resources :reviews do
      resource :bookmarks, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :tags, only: [:index, :show]
    resources :items, only: [:index, :show]
    resources :hotels, only: [:create, :index, :show]
    get 'hotels', to: 'users/hotels#search'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end