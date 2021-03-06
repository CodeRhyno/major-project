Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'device_api/create'
    end
  end
  devise_for :users
  root 'pages#index'

  resources :admin_panel, only: [:index]
  get 'admin/users_panel', to: 'admin_panel#show_users_panel', as: 'show_users_panel'
  get 'admin/devices_panel', to: 'admin_panel#show_devices_panel', as: 'show_devices_panel'
  post 'admin/generate_new_user_token/:id', to: 'admin_panel#generate_new_token', as: 'gen_new_token'

  resources :user_panel, only: [:index]

  resources :devices
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
