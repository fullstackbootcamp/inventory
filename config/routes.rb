Rails.application.routes.draw do
  resources :products, only: %i[index show edit destroy new create update]
end
