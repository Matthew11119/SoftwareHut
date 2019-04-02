Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"
  devise_for :users
  # resources :archives, except: [:new, :create]
  # resources :templates
  resources :students do
    collection { post :my_import}
  end
  resources :exams
  get '/templates', to: 'exams#index', as: 'templates', except: [:deploy]
  get '/archive',   to: 'exams#index', as: 'archives', except: [:new, :create, :deploy]
  #resources :templates
  #resources :archives#, except: [:new, :create]
  resources :uni_modules
  resources :criteria_results
  resources :station_results
  resources :stations do
    member do
      get 'detail'
      get 'detail_form'
      post 'detail_form'
    end
  end

  root to: "pages#home"
  resources :users

  resources :criteria
  post 'criteria/:id', to: 'criteria#create'
  resources :answers
  post 'answers/:id', to: 'answers#create'

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
