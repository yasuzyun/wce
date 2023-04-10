Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
  end

  resources :customers,     only: [:show,:create, :edit, :update, :destroy] do
     # collection do
  	  #   get 'quit'
  	  #   patch 'out'
  	 # end
  end  

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
 get '/admins' => 'homes#top'
 resources :customers,only: [:index,:show,:edit,:update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
