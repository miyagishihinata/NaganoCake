Rails.application.routes.draw do
  root to: "public/homes#top"
  get 'about' => 'public/homes#about'
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    get '/' => 'homes#top'
  end

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/comfirm' => 'orders#comfirm'
    get 'orders/complete' => 'orders#complete'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end



  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
    sessions: 'public/sessions'
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
