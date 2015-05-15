Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'users/:id' => 'users#get'
    end
  end
end
