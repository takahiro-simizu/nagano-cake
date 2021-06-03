Rails.application.routes.draw do
  # devise_for :customers
  # devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'public/homes#top'
  
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  scope module: :public do
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
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
  
  devise_for :customers, controllers: {
     sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations',
  }
    
  namespace :admin do
    get '' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get '/orders/:id' => 'orders#show'
  end

end
