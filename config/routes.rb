Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'hello', to: 'hello#index'
    end
  end
end
