Rails.application.routes.draw do
  resources :urls
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "urls#new"
  get "/:url", to: "redirect#index"
end
