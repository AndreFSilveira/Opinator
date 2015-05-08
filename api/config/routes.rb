Rails.application.routes.draw do
  namespace :v1  do
    # users routes
    get 'users' => 'users#show'
  end
end
