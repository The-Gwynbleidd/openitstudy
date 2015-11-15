Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get 'follow', 'unfollow'
    end
  end


  get 'landing' => 'static_pages#landing'
  get 'dashboard' => 'users#dashboard'
  root 'static_pages#landing'
end
