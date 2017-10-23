Rails.application.routes.draw do
  devise_for :users
  get "top/show"

  root to: "top#show"
end
