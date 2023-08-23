Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
   namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :orders, only: [:show]
  end
  
  scope module: :public do
    root to: "homes#top"
    delete "/cate_items/destroy_all"=>"cart_items#destroy_all"
    get "/customers/my_page"=>"customers#show"
    get "/customers/information/edit"=>"customers#edit"
    patch "/customers/information"=>"customers#update"
    get "/customers/confirm"=>"customers#confirm"
    patch "/customers/withdrawal"=>"customers#withdrawal"
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    get "/orders/complete"=>"orders#complete"
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/confirm"=>"orders#confirm"
    get "/home/about"=>"homes#about",as:"about"
  end  
end
