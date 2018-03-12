Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions/create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions/destroy', as 'signout'

  get 'home/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/pages/:page" => "pages#show"
  resources :tasks
  resources :tasks do
    post 'complete', on: :member
  end

  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]

  root :to => redirect('/pages/home')
end
