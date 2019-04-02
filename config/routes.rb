Rails.application.routes.draw do

  root "site/home#index"

  namespace :site do
    get "home/index"
  end

  namespace :backoffice do
    get "dashboard", to: "dashboard#index"
  end

  devise_for :admins
  devise_for :members

end
