Rails.application.routes.draw do

  root 'home#top'
  devise_for :users
  resource :user, except: [:new, :create, :destroy]
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
  end

end
