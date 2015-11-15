Rails.application.routes.draw do
  devise_for :users
  resources :users


  get 'landing' => 'static_pages#landing'
  get 'dashboard' => 'users#dashboard'
  root 'static_pages#landing'
end
