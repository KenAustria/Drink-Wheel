Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'welcome#index'
  resources :drinks, only: [:show, :index] do
  	collection do
  		get :search
  	end
  end

  resources :wheels, only: [:index] do
    member do
      post :spin
    end
  end

  namespace :admin do
    root 'drinks#index'
    resources :drinks
    resources :wheels
  end
end 
