Rails.application.routes.draw do
  devise_for :users, path: 'user', path_names: { sign_in: 'login', sign_out: 'logout' }

  devise_scope :user do
    # Redirests signing out users back to sign-in (necessary when deleting user)
    get 'users', to: 'posts#index'
  end

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#index'
end
