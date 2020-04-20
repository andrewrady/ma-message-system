Rails.application.routes.draw do
  root "schools#index"
  devise_for :admins

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :schools
  get '/approvals', to: 'admins#index'
  post 'approvals', to: 'admins#update'
  get '/s/:shortSlug', to: 'links#show', as: :short
end
