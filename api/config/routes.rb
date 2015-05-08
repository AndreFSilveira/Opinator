Rails.application.routes.draw do
  devise_for :users
  namespace :v1  do
    # users routes
    get 'users' => 'users#show'
    get 'users/create' => 'users#create'
  end
end
