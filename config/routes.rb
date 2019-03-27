Rails.application.routes.draw do

    resources :exams
    resources :archives, except: [:new, :create]
    resources :templates
    resources :students do
      collection { post :my_import}
    end
    resources :uni_modules

    resources :stations
    resources :criteria
    post 'criteria/:id', to: 'criteria#create'
    resources :answers
    post 'answers/:id', to: 'answers#create'

    resources :criteria_results
    resources :station_results

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


  resources :students do
    collection { post :my_import}
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
