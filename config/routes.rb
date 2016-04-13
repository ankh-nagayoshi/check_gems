Rails.application.routes.draw do
  
  resources :rubygems, only: [:index, :show]
  
  namespace :invalid_gem do
    post :by_lockfile
    get :by_lockfile
    post :by_list
    get :by_list
  end
  
  root 'rubygems#index'
  
end
