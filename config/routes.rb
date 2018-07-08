Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  "/a" => "angular#index", as: :angular

  # Users

  resources :users, only: [ :index, :destroy ]

  root to: 'angular#index'

end
