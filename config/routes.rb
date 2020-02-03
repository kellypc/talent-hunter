Rails.application.routes.draw do
  devise_for :candidates, path: 'candidates', controllers: {
    registrations: "candidates/devise/registrations",
    sessions: "candidates/devise/sessions"
  }

  devise_for :headhunters, path: 'headhunters', controllers: {
    registrations: "headhunters/devise/registrations",
    sessions: "headhunters/devise/sessions"
  }

  namespace :headhunters do
    namespace :admin do
      resources :jobs, except: [:destroy] do
        post :inactive

        resources :job_applications, only: %i[index show] do
          post :highlight
          post :refuse
          get :refuse

          resources :job_proposals, only: %i[index new create show]
        end
      end

      resources :profiles, only: %i[show] do
        resources :comments, only: %i[new create]
      end
    end
  end

  namespace :candidates do
    resources :profiles, only: %i[show new create]

    namespace :admin do
      resources :job_applications, only: %i[index show]
      resources :job_proposals, only: %i[index show update]
    end
  end

  resources :jobs do
    resources :job_applications
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :job_applications, only: %i[show create]
    end
  end

  root 'home#index'
  get 'search', to: "home#search"
end
