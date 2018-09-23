Rails.application.routes.draw do
  post 'users/signup'
  post 'users/signin'
  post 'teklifs/get_ilac_auto_complete'

  resources :teklifs
  resources :eczanes
end
