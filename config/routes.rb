Rails.application.routes.draw do
  root to: 'users#show'

  devise_for :users, path:'accounts'

  resources :users do
    resources :rooms do
      resources :users_rooms
      resources :messages
    end
  end

  mount ActionCable.server => '/cable'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
