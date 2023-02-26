Rails.application.routes.draw do
  resources :records
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :patients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'noutati', to: 'static_pages#noutati'
  get 'about', to: 'static_pages#about'
  get 'ajutor', to: 'static_pages#ajutor'
  # Defines the root path route ("/")
  root "static_pages#home"
end
