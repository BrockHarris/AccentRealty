AccentRealty::Application.routes.draw do

	match '/admin', :to => 'admins#admin_start'
	match '/admin/dashboard', :to => 'admins#dashboard'
	match '/usersignout', :to => 'sessions#destroy'
  match '/adminsignout', :to => 'adminsessions#destroy'
  match '/resources', :to => 'pages#resources'
  match '/contact', :to => 'pages#contact'
  match '/blog', :to => 'pages#blog'
  match '/subscribe', :to => 'pages#user_start'
  match '/myaccount', :to => 'users#myaccount'
  match '/assist', :to => 'users#assist'
  match "/reset/:id/:reset_code", :to=>"users#reset", :as=>"reset"
  
  resources :messages
  resources :admins
  resources :users 
  resources :pages
  resources :blogposts
  resources :sessions,   :only => [:new, :create, :destroy]
  resources :adminsessions,   :only => [:new, :create, :destroy]

  root :to => 'pages#home'
end
