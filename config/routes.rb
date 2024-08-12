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
  devise_for :users
  root 'schedules#index'
end
