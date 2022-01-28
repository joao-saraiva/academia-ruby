Rails.application.routes.draw do
  resources :lesson_doubt_comments
  resources :lesson_doubts
  resources :lessons, except: [:edit, :destroy, :create, :update, :new]
  devise_for :users, controllers: {
      sessions: "users/sessions", registrations: 'users/registrations' 
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: "users/sessions#new"
  end

  get '/lesson_doubts/create_doubt_by_lesson/:lesson_id', to: 'lesson_doubts#new', as: 'new_doubt_by_lesson'
  post 'lesson_doubt_comments/post_comment/', to: 'lesson_doubts#post_comment', as: 'post_comment'

end
