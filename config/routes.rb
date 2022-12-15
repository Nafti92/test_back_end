Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :listings, except: [:edit]
      resources :missions, only: [:index]
    end
  end
end
