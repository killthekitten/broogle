Rails.application.routes.draw do
  root "famous_quotes#index"

  resources :famous_quotes, only: [:index, :show, :new, :create], path: :quotes
end
