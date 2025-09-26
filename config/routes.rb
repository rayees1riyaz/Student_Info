Rails.application.routes.draw do
  root 'main#main'   # Landing page for everyone

  get "/index", to: "main#index"  # Student dashboard

  get "admissions/search", to: "admissions#search"
  post "admissions/search_by_id", to:"admissions#search_by_id"
  get "courses/search", to: "courses#search"
  post "courses/search_by_id", to:"courses#search_by_id"
  get "results/search", to: "results#search"
  post "results/search_by_id", to:"results#search_by_id"
  get "applications/search", to: "applications#search"
  post "applications/search_by_id", to:"applications#search_by_id"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/signup", to: "users#signup"
  post "/signup", to: "users#create"

  get "/student_login", to: "sessions#student_login"
  post "/student_login", to: "sessions#student_create"
  delete "/logout", to: "sessions#destroy"

  resources :students, only: [:index,:new,:create,:show]
  resources :applications do
    patch "approve", to: "applications#approve", on: :member
    patch "reject",  to: "applications#reject",  on: :member
  end
  resources :admissions, only: [:show] 
  resources :courses, only: [:show] 
  resources :results, only: [:show] 

  get "up" => "rails/health#show", as: :rails_health_check
end
