Rails.application.routes.draw do

  root "site/home#index"

  get "dashboard", to: "backoffice/dashboard#index"
  namespace :backoffice do
    #get 'admins', to: "admins#index"
    resources :admins, except: [:show]
    resources :categories, except: [:show, :destroy]
    resources :send_messages, only: [:edit, :create]
    resources :diagrams, only: [:index]
  end

  namespace :site do
    get "home", to: "home#index"

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :new, :create]
      resources :my_data, only: [:edit, :update]
    end

    resources :ad_detail, only: [:show, :index]
    resources :category, only: [:show]
    resources :comments, only: [:create]

    get "search", to: "search#ads"
  end

  devise_for :admins, :skip => :registration
  devise_for :members,
   controllers: {
     sessions: "members/sessions",
     registrations: "members/registrations"
  }

end
