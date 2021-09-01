Rails.application.routes.draw do
  resources :comments
  resources :photos
  resources :reports
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[create index]
  post 'login', to: 'users#login'
end
