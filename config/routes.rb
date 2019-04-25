Rails.application.routes.draw do

  root "site/home#index"

  get "dashboard", to: "backoffice/dashboard#index"
  namespace :backoffice do
    #get 'admins', to: "admins#index"
    resources :admins, except: [:show]
    resources :categories, except: [:show, :destroy]
    resources :send_messages, only: [:edit, :create]
  end

  namespace :site do
    get "home", to: "home#index"

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :new, :create]
    end

    resources :ad_detail, only: [:show]
    resources :category, only: [:show]

  end

  devise_for :admins, :skip => :registration

  devise_for :members, controllers: { sessions: "members/sessions"}

end
