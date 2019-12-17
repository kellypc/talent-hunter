Rails.application.routes.draw do
  devise_for :headhunters, path: 'headhunters', controllers: {
    registrations: "headhunters/devise/registrations",
    sessions: "headhunters/devise/sessions"
  }

  root 'home#index'
end
