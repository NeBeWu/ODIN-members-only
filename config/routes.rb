Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'posts#index'

  devise_for :users, path: 'user', path_names: { sign_in: 'login', sign_out: 'logout' }

  devise_scope :user do
    # Redirects signing out users back to sign-in (necessary when deleting user)
    get 'users', to: 'posts#index'
  end

  resources :users do
    member do
      post 'follow'
      delete 'unfollow'
    end
  end

  resources :posts do
    member do
      post 'add_like'
      delete 'remove_like'
      post 'add_dislike'
      delete 'remove_dislike'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
