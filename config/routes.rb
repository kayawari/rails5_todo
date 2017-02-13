Rails.application.routes.draw do
  root 'todos#index'

  resources :todos do
    member do
      post 'check'
    end
  end

  resources :users

end
