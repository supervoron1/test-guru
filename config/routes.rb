Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  resources :tests do
    resources :questions
  end

  # resource :account

  # resource :account, controller: :account

  # resources :tests, only: %i[index show]

  # resources :tests do
  #   resources :questions
  # end

  # resources :tests do
    # resources :questions, shallow: true # сокращает url
  # end

# -------------- ***** ------------------
  # GET /tests/beginner  # чтобы реализовать такие урлы см ниже
  # POST /tests/1/start

  # resources :tests do
  #   get :beginner, on: :collection

  #   member do
  #     post :start
  #   end
  # end
# -------------- ***** ------------------

  # get '/test', to: 'tests#index'
  # get '/test/:id', to: 'tests#show', as: :test
  # get '/test(/:id)', to: 'tests#show', as: :test # необязательный параметр id

  get '/tests/:id/start', to: 'tests#start', as: :start
  # get '/tests/:id/start', to: 'tasks#start'
  # get '/tests/:test_id/questions/:id(.:format)', to: 'questions#show'

  # match '/tests/:id', to: 'tests#create', via: %i[post put]
  # match '/tests/:id', to: 'tests#create', via: :all

  # /tests/backend/ruby
  # get '/tests/:category/:title', to: 'tests#search'

end
