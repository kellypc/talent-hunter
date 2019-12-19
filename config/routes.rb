Rails.application.routes.draw do
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

  root 'home#index'
end
