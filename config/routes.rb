Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
  end
end
