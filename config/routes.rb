Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users
      resources :comments
      get 'opinions/count' => 'opinions#count'
      resources :opinions
      resources :disagrees
      resources :agrees
    end
  end
end
