Rails.application.routes.draw do
  resources :albums do
    resources :photos
  end
end
