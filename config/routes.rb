Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'panel/v1/municipes#index'
  namespace :panel do
    namespace :v1 do
      root to: 'panel/v1/municipes#index'
      resources :municipes do
        resources :enderecos
      end
    end
  end
end
