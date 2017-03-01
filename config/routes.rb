Rails.application.routes.draw do
  resources :events do
    resources :guestships
    resources :invites
  end
  get 'home/index'
  get 'invites/my_invites'
  post '/accept' => 'invites#accept', as: :accept

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
