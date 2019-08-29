Rails.application.routes.draw do
  get 'user/show'
  get 'user/index'
  match 'users/:id' => 'user#destroy', :via => :delete, :as => :admin_destroy_user
  resources :recipes
  devise_for :users
  root 'recipes#index'
  get  '/about',   to: 'static_pages#about'
end
