Rails.application.routes.draw do

  root "site#index"

  resources :owners do
  	resources :pets, only: :index, :show, :new, :create

end
