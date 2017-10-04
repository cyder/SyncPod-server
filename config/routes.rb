Rails.application.routes.draw do
  get 'top/show'

  root to: 'top#show'
end
