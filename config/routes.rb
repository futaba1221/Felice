Rails.application.routes.draw do

 devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
 }

  get "users/:id/nices" => "users#nices"
  get "users/:id/diarys" => "users#diarys"
  get "users/:id/match" => "users#match"
  get "users/:id/like" => "users#like"
  get "users/:id/relike" => "users#relike"
  put "users/:id/hide" => "users#hide"
  get "users/:id/reregistration" => "users#reregistration"
  post "users/:id/restoration" => "users#restoration"
  
  resources :users, :only => [:index, :show, :destroy] do
   member do
       get :following, :followers
   end
   
   resources :footprints, only: [:index]
   resources :searches
  end 
  
  

  resources :relationships, only: [:index, :create, :destroy]
  
  resources :posts, :only => [:new, :create, :edit, :update, :destroy] do
    resources :comments, :only => [:new,:create, :destroy, :edit, :update] do
    end
  end

  resources :posts, :only => [:index, :show]
  

  get "footprint" => "footprints#new"
  post "footprint" => "footprints#create"
  post "nices/:post_id/create" => "nices#create"
  post "nices/:post_id/destroy" => "nices#destroy"
  
  get "home/happy" => "home#happy"
  get "home/felice" => "home#money"
  get "home/question" => "home#question"
  
  root "home#top"
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
