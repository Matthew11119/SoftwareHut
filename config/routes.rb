Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"

  resources :station_results
  resources :exams do
    collection { post :student_import}
    get 'import'
  end
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

  get 'station_results/new/:student_id/:station_id', to: 'station_results#new'

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

  get 'results', to: 'exams#results', as: 'results'
  get 'exams/:id/results', to: 'exams#exam_results', as: 'exam_results'
  get 'exams/:exam_code/results/:username', to: 'station_results#student_result', as: 'student_result'
  resources :station_results, only: [:show, :new, :edit, :update, :destroy]
  resources :criteria_results, only: [:new, :edit, :update, :destroy]

  
  root to: "pages#home"
  devise_for :users
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
