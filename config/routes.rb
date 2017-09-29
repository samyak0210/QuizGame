Rails.application.routes.draw do
  resources :hollywoods
  resources :bollywoods
  resources :footballs
  resources :crickets
  resources :leaderboards
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }

  devise_scope :user do
  	delete 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_fuser_session
  end
   	  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
