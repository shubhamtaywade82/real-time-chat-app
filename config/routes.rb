Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :users, only: %i[index show]
  resources :chat_rooms, only: %i[index new create show] do
    resources :messages
    member do
      get 'join'
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'chat_rooms#index'
end
