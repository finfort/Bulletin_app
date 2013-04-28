BulletinApp::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
             controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users
  resources :advertisements do
    resources :comments
  end

  root :to => 'static_pages#home'
end
