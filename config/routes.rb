Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'device_api/index'
    end
  end
  devise_for :users
  root 'pages#index'

  resources :admin_panel, only: [:index]
  get 'admin/users_panel', to: 'admin_panel#show_users_panel', as: 'show_users_panel'
  get 'admin/devices_panel', to: 'admin_panel#show_devices_panel', as: 'show_devices_panel'

  resources :user_panel, only: [:index]

  resources :devices
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
