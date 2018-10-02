Rails.application.routes.draw do
  post 'users/signup'
  post 'users/signin'
  post 'teklifs/get_ilac_auto_complete'
  post 'alims/get_gonderimlerim'

  resources :teklifs
  resources :eczanes do
    resources :alims
    resources :bakiyes
  end
  resources :alims
  resources :bakiyes
end
