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
    get "home/index"
  end

  devise_for :admins, :skip => :registration

  devise_for :members

end
