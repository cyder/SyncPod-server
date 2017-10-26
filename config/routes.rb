Rails.application.routes.draw do
  devise_for :users
  get "top/show"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :login, only: [:create], controller: :session
      resource :users, only: [:create]
      resource :room, only: [:create]
    end
  end

  root to: "top#show"
end
