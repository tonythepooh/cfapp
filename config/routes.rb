Rails.application.routes.draw do
  

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: { registrations: "user_registrations" }
  # Add path for users
  resources :users
  resources :products do
    resources :comments
  end
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  post 'static_pages/thank_you'

  post 'payments/create'

  mount ActionCable.server => '/cable'

  # root 'welcome#index'
  root 'static_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

