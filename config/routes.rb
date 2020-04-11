Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :schools
  get '/s/:shortSlug', to: 'links#show', as: :short
end
