AccentRealty::Application.routes.draw do
	
	match '/signout', :to => 'sessions#destroy'
  match '/adminsignout', :to => 'adminsessions#destroy'
  
  resources :messages
  resources :admins
  resources :pages
  resources :sessions,   :only => [:new, :create, :destroy]
  resources :adminsessions,   :only => [:new, :create, :destroy]
  resources :users 

  root :to => 'pages#home'
end
