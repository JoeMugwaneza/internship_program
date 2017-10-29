Rails.application.routes.draw do
  root to: 'pages#welcome'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'signout', to: 'devise/sessions#destroy', as: :signout
  end
end


