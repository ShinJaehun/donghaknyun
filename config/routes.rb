Rails.application.routes.draw do
  resources :items do
    member do
      put :move, :clone
    end
  end
  resources :schedules do
    resources :lists
  end
  get 'schedule_pick', to: 'schedules#schedule_pick'
  #resources :lists do
    #member do
      #put :sort
    #end
  #end
  devise_for :users
  root 'site#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
