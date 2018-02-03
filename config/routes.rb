Rails.application.routes.draw do
  resources :contacts
  
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :sessions
  resources :users

  resources :blogs do
    collection do
      post :confirm
    end
  end

  root :to => "blogs#top"

  resources :favorites, only: [:create, :destroy]
end
