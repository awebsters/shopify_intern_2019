Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'products' => 'products#index'
      get 'products/:id' => 'products#show'
      get 'products/:id/purchase' => 'products#purchase'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
