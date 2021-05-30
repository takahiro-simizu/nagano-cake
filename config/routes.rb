Rails.application.routes.draw do
  # devise_for :customers
  # devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'public/homes#top'

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :registrations, only: [:new, :create]
    resource :customers, only: [:show, :edit, :update]
    get '/customers/resign' => 'customers#resign'
    patch '/customers/resign_prcs' => 'customers#resign_prcs'
    resources :cart_items, only:[:index, :update, :create]
    delete '/cart_items/:id' => 'cart_items#destroy'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :index, :show]
    post '/orders/check' => 'orders#check'
    get '/orders/thanks' => 'orders#thanks'
    post '/orders' => 'orders#create'
  end

  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    get '' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get '/orders/:id' => 'orders#show'
  end

end
