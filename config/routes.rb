MapiKataRailsApiAms::Application.routes.draw do
  resources :users, :only => [:create, :show] do
    resources :posts, :only => [:create, :index]
  end
  resources :tokens, :only => [:create]

  resources :posts, :only => [:show, :destroy]
end
