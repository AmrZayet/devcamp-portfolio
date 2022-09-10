Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: "portfolios#show"

  get 'about', to: "pages#about"
  get 'contact', to: "pages#contact"

  resources :blogs do 
    member do
      get :toggle_status
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"
end
