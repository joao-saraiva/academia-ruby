Rails.application.routes.draw do
  resources :lesson_doubt_comments
  resources :lesson_doubts
  resources :lessons_started_by_user
  resources :lessons
  devise_for :users, controllers: {
      sessions: "users/sessions", registrations: 'users/registrations' 
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: "users/sessions#new"
  end
end
