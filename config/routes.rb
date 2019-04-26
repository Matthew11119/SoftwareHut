Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"

  resources :exams
  resources :archives, except: [:new, :create]
  resources :templates
  resources :students do
    collection { post :student_import}
    collection do
      delete 'destroy_multiple'
    end
  end
  resources :uni_modules    
  resources :station_results do
    member do
      get 'ready_screen'
      get 'completed_students'
      get 'add_student'
      post 'search_new_student'
    end    
  end
  post '/station_results/:id', to: 'station_results#new_student'  
  resources :stations, only: [:new,:edit,:update,:destroy, :show] do
    member do
      # get 'detail'
      # get 'detail_form'
      # post 'detail_form'
    end
  end
  post 'stations/:id', to: 'stations#create'

  resources :criteria, only: [:new,:edit,:update,:destroy]
  post 'criteria/:id', to: 'criteria#create'
  resources :answers, only: [:new,:edit,:update,:destroy]
  post 'answers/:id', to: 'answers#create'

  root to: "pages#home"
  devise_for :users
  resources :users

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
