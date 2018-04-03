Rails.application.routes.draw do
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'

  get 'home/show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/pages/:page" => "pages#show"
 get 'teams/search' => 'teams#search'

  resources :teams do
    resources :tasks
    resources :tasks do
      post 'complete', on: :member
    end
  end

  resources :sessions, only: [:create, :destroy]

  #root :to => redirect('/teams')
  root :to => redirect('/pages/home')
end
