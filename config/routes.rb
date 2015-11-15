Rails.application.routes.draw do
  get 'landing' => 'static_pages/landing'
  root 'static_pages#landing'
end
