Rails.application.routes.draw do
  root to: 'users#index'
  
  resources :users, only: [:index, :show], param: :name do
    resources :posts, only: [:index, :show]
  end
end
