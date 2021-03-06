Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"

  resources :station_results
  resources :exams do
    collection { post :student_import}
    get 'edit/:id', to: 'exams#import', as: 'edit_import'
  end
  resources :archives, except: [:new, :create]
  resources :templates
  resources :students, except: [:index] do
    collection { post :student_import}
    collection do
      delete 'destroy_multiple'
    end
  end
  resources :uni_modules
  resources :station_results do #, except: [:edit] do
    member do
      get 'ready_screen'
      get 'completed_students'
      get 'add_student'
      post 'search_new_student'
      post 'search_students'
    end
  end

  get 'station_results/new/:student_id/:station_id/examiner_name', to: 'station_results#new'
  post '/station_results/new/:student_id/:station_id/examiner_name', to: 'station_results#new'
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

  get 'results', to: 'exams#results', as: :results
  get 'results/:exam_code', to: 'exams#exam_results', as: :exam_results

  get 'results/:exam_code/exam_pdfs', to: 'exams#exam_pdfs', as: :exam_pdfs
  get 'results/:exam_code/:username', to: 'station_results#student_result', as: :student_result
  #get 'results/:exam_code/:username/:station_id', 'station_results#edit', as: :edit_station_result
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
