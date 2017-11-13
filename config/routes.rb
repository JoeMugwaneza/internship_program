Rails.application.routes.draw do
  get 'dashboards/index'

  get 'dashboards/show'

  get 'dashboard/index'

  get 'dashboard/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'surveys#index'

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
  get "/welcome" => "pages#welcome", as: "welcome"
  get "/signup2" =>"pages#signup2"
  get '/dashboards' => "dashboards#index"
end


