Rails.application.routes.draw do
  resources :users, only: [:create, :show, :update]
    post "/signup", to: "users#create"
    post "/login", to: "authentication#create"
    get "/authorized", to: "authentication#show"
  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #     get 'hello', to: 'hello#index'
  #   end
  # end
end
