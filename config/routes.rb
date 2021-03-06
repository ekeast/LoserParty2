Rails.application.routes.draw do
  resources :events do
      resources :invites, except: [:show]
  end
  get 'home/index'
  get 'invites/my_invites'
  get 'guestships/my_guestships'
  get 'invites/accepted_invites'
  post 'invites/:id/accept' => 'invites#accept', as: 'invite_accept'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
