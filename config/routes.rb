Rails.application.routes.draw do
  resources :outfits
  resources :items, only: [:index, :create, :update, :destroy]
  resources :categories, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
