Rails.application.routes.draw do
  get 'user/show'
  get 'user/index'
  resources :recipes
  devise_for :users
  match 'users/:id' => 'user#destroy', :via => :delete, :as => :admin_destroy_user
  root 'recipes#index'
  get  '/about',   to: 'static_pages#about'
end
