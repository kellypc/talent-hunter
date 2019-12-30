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
      resources :jobs do
        post :inactive

        resources :job_applications do
          post :highlight
          post :refuse
          get :refuse

          resources :job_proposals
        end
      end

      resources :profiles do
        resources :comments
      end
    end
  end

  namespace :candidates do
    resources :profiles

    namespace :admin do
      resources :job_applications
      resources :job_proposals
    end
  end

  resources :jobs do
    resources :job_applications
  end

  root 'home#index'
  get 'search', to: "home#search"
end
