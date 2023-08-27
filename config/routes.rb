Rails.application.routes.draw do
  resources :chat_rooms, only: %i[index new create] do
    member do
      get 'join'
    end
  end
  devise_for :users

  root to: 'home#index'
end
