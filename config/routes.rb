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
    get "created_events", to: "users#created_events", as: "created_events"
    get "invited_events", to: "users#invited_events", as: "invited_events"
    get "invite_users", to: "users#invite_users", as: "invite_users"
  end
  get "view_user_list", to: "users#view_user_list", as: "view_user_list"
  resources :invitations, only: [:create, :destroy]
end
