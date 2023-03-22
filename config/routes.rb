Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :cars
      resources :tail_types
      resources :cargo_types
      resources :news
    end
  end
end
