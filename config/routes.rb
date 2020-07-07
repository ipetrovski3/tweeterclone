Rails.application.routes.draw do
  resources :tweets do
    resources :comments
  end

  resources :users do
    get 'tweets', to: 'users#tweets'
  end

  root to: 'tweets#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
