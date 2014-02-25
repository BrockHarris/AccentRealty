AccentRealty::Application.routes.draw do

	match '/admin_login', :to => 'admins#admin_start'
  match '/admin/settings', :to => 'admins#settings'
  match '/admin/newsletter', :to => 'admins#newsletter'
  match '/admin/users', :to => 'admins#users'
  match '/admin/blog', :to => 'admins#blogposts'
  match '/admin/messages', :to => 'admins#messages'
  match '/admin/questions', :to => 'admins#questions'
  match '/admin/evaluations', :to => 'admins#evaluations'
  match '/admin/local_partners', :to => 'admins#local_partners'
  match '/admin/buyertips', :to => 'admins#buyertips'
  match '/admin/sellertips', :to => 'admins#sellertips'
  match '/admin/advice', :to => 'admins#advice_admin'
  match "/evaluations/:id/mark_read", :to => "evaluations#mark_read", :as => "mark_evaluation_read"
  match "/evaluations/:id/mark_unread", :to => "evaluations#mark_unread", :as => "mark_evaluation_unread"
  match "/messages/:id/mark_read", :to => "messages#mark_read", :as => "mark_read"
  match "/messages/:id/mark_unread", :to => "messages#mark_unread", :as => "mark_unread"
	match '/usersignout', :to => 'sessions#destroy'
  match '/adminsignout', :to => 'adminsessions#destroy'
  match '/resources', :to => 'pages#resources'
  match '/advice', :to => 'pages#advice'
  match '/local_partners', :to => 'pages#localpartners'
  match '/communities', :to => 'pages#communities'
  match '/listings', :to => 'pages#listings'
  match '/listings/sample1', :to => 'pages#sample1' # Sample of show page #
  match '/contact', :to => 'pages#contact'
  match '/blog', :to => 'pages#blog'
  match '/disclaimer', :to => 'pages#disclaimer'
  match '/eop_disclaimer', :to => 'pages#eop_disclaimer'
  match '/about', :to => 'pages#about'
  match '/evaluate', :to => 'pages#evaluate'
  match '/myaccount', :to => 'users#myaccount'
  match '/settings', :to => 'users#settings'
  match "/users/:id/:unsubscribe", :to => "users#unsubscribe", :as=>"unsubscribe"
  match '/assist', :to => 'users#assist'
  match "/reset/:id/:reset_code", :to => "users#reset", :as=>"reset"
  
  resources :messages
  resources :evaluations
  resources :pages
  resources :blogposts
  resources :communities
  resources :questions
  resources :pagecontents
  resources :admins
  resources :users 
  resources :sessions,   :only => [:new, :create, :destroy]
  resources :adminsessions,   :only => [:new, :create, :destroy]

  root :to => 'pages#home'
end
