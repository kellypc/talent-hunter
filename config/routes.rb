Rails.application.routes.draw do

  devise_for :candidates, path: 'candidates', controllers: {
    registrations: "candidates/devise/registrations"
  }

  devise_for :headhunters, path: 'headhunters', controllers: {
    registrations: "headhunters/devise/registrations",
    sessions: "headhunters/devise/sessions"
  }

  namespace :headhunters do
    namespace :admin do
      resources :jobs do
        post :inactive
      end
    end
  end

  namespace :candidates do
    resources :profiles
  end

  root 'home#index'
end
