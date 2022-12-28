Rails.application.routes.draw do
  root to: "public/homes#top"
  get 'about' => 'public/homes#about'
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    get '/' => 'homes#top'
  end

  scope module: :public do
    resources :items, only: [:index, :show]

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
