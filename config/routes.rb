Rails.application.routes.draw do

  root to: 'pages#welcome'
  devise_for :users

  devise_scope :user do
    get 'signout', to: 'devise/sessions#destroy', as: :signout
  end
end
