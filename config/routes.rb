Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'signout', to: 'devise/sessions#destroy', as: :signout
  end

  resources :surveys
  resources :questions
  resources :answers

  # designs
  get "/signup" => "pages#signup"
  get "/home" => "pages#home"
  get "/signup2" =>"pages#signup2"
end


