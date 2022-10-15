Rails.application.routes.draw do

  root to: 'users/homes#top'
  get 'about' => 'users/homes#about'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  }

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  scope module: 'users' do
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only: [:show, :edit, :update]
    resources :reviews do
      resource :bookmarks, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end