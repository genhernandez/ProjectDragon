Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/pages/:page" => "pages#show"
  resources :tasks
  resources :tasks do
    post 'complete', on: :member
  end
  root :to => redirect('/pages/home')
end
