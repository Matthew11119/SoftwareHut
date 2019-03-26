Rails.application.routes.draw do

  resources :exams
  get '/templates', to: 'exams#index', as: 'templates', except: [:deploy]
  get '/archive',   to: 'exams#index', as: 'archives', except: [:new, :create, :deploy]
  #resources :templates
  #resources :archives#, except: [:new, :create]
  resources :students
  resources :uni_modules
  resources :criteria_results
  resources :station_results
  resources :criteria
  resources :stations do
    member do
      get 'detail'
      get 'detail_form'
      post 'detail_form'
    end
  end
  mount EpiCas::Engine, at: "/" 
  devise_for :users
  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  root to: "pages#home"
  resources :users



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
