Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users
      resources :comments
      get 'opinions/filter/:user_id' => 'opinions#index'
      get 'opinions/count' => 'opinions#count'
      get 'users/logged/:id'=> 'users#logged'
      get 'users/uid/:uid'=> 'users#find_by_uid'
      resources :opinions
      resources :disagrees
      resources :agrees
    end
  end
end
