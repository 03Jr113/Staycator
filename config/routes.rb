Rails.application.routes.draw do

  root to: 'users/homes#top'
  get 'about' => 'users/homes#about'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  scope module: 'users' do
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    # get 'users/mypage' => 'users#show'
    get 'users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    resources :users, only: [:show, :edit, :update]
    resources :reviews
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end