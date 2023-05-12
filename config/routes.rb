Rails.application.routes.draw do
  resources :events, only: %i[show new create] do
    get 'result'
    resources :votes, only: %i[new create]
    resources :scores, only: %i[create destroy]
  end
  root "homes#index"
end
