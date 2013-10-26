MapiKataRailsApiAms::Application.routes.draw do
  resources :users, :only => [:create, :show]
  resources :tokens, :only => [:create]
end
