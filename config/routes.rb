Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"
  get 'top_commenters', to: 'commenters#index'
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end
end
