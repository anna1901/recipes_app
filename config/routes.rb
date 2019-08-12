Rails.application.routes.draw do
  get 'user/show'
  resources :recipes
  devise_for :users
  root 'recipes#index'
  get  '/about',   to: 'static_pages#about'
end
