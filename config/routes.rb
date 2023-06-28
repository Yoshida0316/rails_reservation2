Rails.application.routes.draw do
  get 'reservations/index'
  get 'books/index'
  get 'users/index',to: 'users#index'
  get 'rooms/index'
  #post 'reservation/create'
  devise_for :users
  resources :users
  root 'books#index'
  
  resources :rooms do  #ransack検索機能
  collection do
    get 'search',to: 'rooms#search'
  end   
  end 
  
  resources :reservations do
    collection do
      post :confirm
 end
 end
  
  resources :rooms
end
