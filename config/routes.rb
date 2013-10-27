MapiKataRailsApiAms::Application.routes.draw do
  resources :users, :only => [:create, :show] do
    resources :posts, :only => [:create, :index]
    resources :following, :only => [:destroy] do
      member do
        put :create
      end
    end
  end
  resources :tokens, :only => [:create]

  resources :posts, :only => [:show, :destroy]
end
