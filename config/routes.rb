Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "events#index"
  resources :events do
    get "/attendees", to: "events#attendees", as: "attendees"
  end
  resources :users, only: [:show] do
    get "attended_events", to: "users#attended_events", as: "attended_events"
  end
  resources :invitations, only: [:create, :destroy]
end
