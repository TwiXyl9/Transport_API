Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'authentication', controllers: {
    confirmations: 'overrides/confirmations'
  }

  namespace :api do
    namespace :v1 do
      resources :users, :only => [:show, :update] do
        resources :orders, :only => [:index, :show]
      end
      resources :orders
      resources :cars
      resources :tail_types
      resources :cargo_types
      resources :news
      resources :additional_services, :path => 'services'
    end
  end
end
