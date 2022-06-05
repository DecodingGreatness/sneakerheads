Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :sneakers, only: [ :new, :create, :show ]
    resources :transactions
  end

  resources :transactions do
    resources :reviews, only: [:new, :create]
  end

  resources :sneakers do
    collection do
      get 'brand/:brand_name', to: 'sneakers#brand', as: :brand
    end
  end

  resources :sneakers do
    resources :transactions
  end

end
