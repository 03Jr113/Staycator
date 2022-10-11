Rails.application.routes.draw do

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  registrations: 'users/registrations',
  # passwords:     'users/passwords',
  }

  root to: 'users/homes#top'
  get 'about' => 'users/homes#about'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  registrations: 'admins/registrations',
  passwords:     'admins/passwords',
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end