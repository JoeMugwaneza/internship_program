Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'surveys#index'

  devise_for :users, controllers: {sessions: 'sessions'}

  devise_scope :user do
    get 'signout', to: 'devise/sessions#destroy', as: :signout
  end

  resources :surveys
  resources :questions
  resources :answers
  resources :users, :only => [:index, :show]
  resources :employers
  resources :applications
  resources :internship_updates

  # designs
  get "/signup" => "pages#signup"
  get "/welcome" => "pages#welcome", as: "welcome"
  get "/signup2" =>"pages#signup2"
  get '/dashboards' => "dashboards#index"

  get '/employers/:id/well_done' => "employers#congratulations", as: "employer_congratulations"
end


