Rails.application.routes.draw do
  #rutas reservaciones
  get 'reservations/new', to: 'reservations#new', as: 'r_n'
  post 'reservations/create', to: 'reservations#create', as: 'r_c'

  #rutas calificaciones estrellas
  get 'stars/new', to: 'stars#new', as: 's_n'
  post 'stars/create', to: 'stars#create', as: 'stars_c'

  #rutas para celebraciones
  patch 'celebrations/update', to: 'celebrations#update', as: 'celebration_u'

  #rutas para ceremonias
  patch 'ceremonies/update', to: 'ceremonies#update', as: 'c_u'

  #rutas para tutoriales
  get 'tutorials/index', to: 'tutorials#index', as:'t_i'

  #rutas invitaciones para invitados
  patch 'invitations/update', to: 'invitations#update', as: 'i_u'

  # rutas administradores
  get 'admins/index', to: 'admins#index', as: 'a_i'
  get 'admins/new', to: 'admins#new', as: 'a_n'
  get 'admins/show', to: 'admins#show', as: 'a_s'
  post 'admins/create', to: 'admins#create', as: 'a_c'
  patch 'admins/update', to: 'admins#update', as: 'a_u'
  
  #rutas invitados
  get 'inviteds/index', to: 'inviteds#index', as: 'i_i'
  post 'inviteds/create', to: 'inviteds#create', as: 'i_c'
  
  # rutas novios
  get 'marriages/index', to: 'marriages#index', as: 'm_i'
  get 'marriages/show', to: 'marriages#show', as: 'm_s'
  patch 'marriages/update', to: 'marriages#update', as: 'm_u'
  
  # rutas para inicio y fin de sesion
  root 'sessions#new'
  post 'sessions/create', to: 'sessions#create', as: 's_c'
  delete 'sessions/destroy', to: 'sessions#destroy', as: 's_d'

  # rutas de creacion de matrimonios
  get 'marriages/new', to: 'marriages#new', as: 'm_n'
  post 'marriages/create', to: 'marriages#create', as: "m_c"
  
  # rutas member
  delete 'admins/destroy/:id', to: 'admins#destroy', as: 'a_d'
  delete 'inviteds/destroy/:id', to: 'inviteds#destroy', as: 'i_d'

end
