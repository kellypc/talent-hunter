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
        end
      end

      resources :profiles
    end
  end

  namespace :candidates do
    resources :profiles
  end

  resources :jobs do
    resources :job_applications
  end

  root 'home#index'
end
