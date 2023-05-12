Rails.application.routes.draw do
  resources :events, only: %i[show new create]
  root "homes#index"
end
