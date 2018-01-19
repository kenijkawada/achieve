Rails.application.routes.draw do
  resources :sessions
  resources :users

  resources :blogs do
    collection do
      post :confirm
    end
  end

  root :to => "blogs#top"
end
