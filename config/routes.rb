Rails.application.routes.draw do
  devise_for :users
  get "top/show"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :login, only: [:create], controller: :session
      resource :users, only: [:create]
      resources :rooms, only: [:index, :create, :show]
      get "joined_rooms", to: "user#joined_rooms"
      get "youtube/search", to: "youtube#search"
      get "youtube/video", to: "youtube#video"
    end
  end

  root to: "top#show"
  mount ActionCable.server => "/cable"
end
