Rails.application.routes.draw do
  root 'todos#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :todos do
    member do
      post 'check'
    end
  end

  resources :users, only: [:show, :new, :create, :index]

end
