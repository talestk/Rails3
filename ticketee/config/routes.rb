Ticketee::Application.routes.draw do


  # the :controllers opt tells Devise you want to customize the controllers it uses
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  # addressing the promblem and defining a route for 
  get '/awaiting_confirmation', :to => "users#confirmation", :as => 'confirm_user'
  
  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end
  
  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
  end
  
  put '/admin/users/:user_id/permissions',
  :to => 'admin/permissions#update',
  :as => :update_user_permissions
  
end
