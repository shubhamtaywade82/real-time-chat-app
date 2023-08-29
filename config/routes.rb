Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :users, only: :index
  resources :chat_rooms, only: %i[index new create show] do
    resources :messages
    member do
      get 'join'
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'chat_rooms#index'
end
