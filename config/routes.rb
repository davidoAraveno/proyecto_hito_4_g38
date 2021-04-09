Rails.application.routes.draw do
  #rutas invitados
  get 'inviteds/index', to: 'inviteds#index', as: 'i_i'
  
  # rutas novios
  get 'marriages/index', to: 'marriages#index', as: 'm_i'

  # rutas para inicio y fin de sesion
  root 'sessions#new'
  post 'sessions/create', to: 'sessions#create', as: 's_c'
  delete 'sessions/destroy', to: 'sessions#destroy', as: 's_d'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
