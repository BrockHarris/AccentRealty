AccentRealty::Application.routes.draw do

	match '/admin', :to => 'admins#admin_start'
  match '/admin/settings', :to => 'admins#settings'
  match '/admin/users', :to => 'admins#users'
  match '/admin/blog', :to => 'admins#blogposts'
  match '/admin/messages', :to => 'admins#messages'
  match '/admin/evaluations', :to => 'admins#evaluations'
  match '/admin/about', :to => 'admins#about'
  match '/admin/localpartners', :to => 'admins#localpartners'
  match '/admin/buyertips', :to => 'admins#buyertips'
  match '/admin/sellertips', :to => 'admins#sellertips'
	match '/usersignout', :to => 'sessions#destroy'
  match '/adminsignout', :to => 'adminsessions#destroy'
  match '/resources', :to => 'pages#resources'
  match '/local_partners', :to => 'pages#localpartners'
  match '/communities', :to => 'pages#communities'
  match '/listings', :to => 'pages#listings'
  match '/listings/sample1', :to => 'pages#sample1' # Sample of show page #
  match '/contact', :to => 'pages#contact'
  match '/blog', :to => 'pages#blog'
  match '/about', :to => 'pages#about'
  match '/evaluate', :to => 'pages#evaluate'
  match '/subscribe', :to => 'pages#user_start'
  match '/myaccount', :to => 'users#myaccount'
  match '/settings', :to => 'users#settings'
  match '/assist', :to => 'users#assist'
  match "/reset/:id/:reset_code", :to=>"users#reset", :as=>"reset"
  
  resources :messages
  resources :evaluations
  resources :admins
  resources :users 
  resources :pages
  resources :blogposts
  resources :communities
  resources :pagecontents
  resources :sessions,   :only => [:new, :create, :destroy]
  resources :adminsessions,   :only => [:new, :create, :destroy]

  root :to => 'pages#home'
end
