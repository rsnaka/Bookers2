Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  
  resources :books, only: [:new, :index, :show, :edit]
  
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
