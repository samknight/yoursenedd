YourSenedd::Application.routes.draw do


  namespace :members do
  get 'speeches/index'
  end

  get 'advertising', to: 'advertising#new', as: 'advertising'
  post 'advertising/create', as: 'send_advertising'

  get 'data-services', to: 'messages#new', as: 'message'
  post 'messages/create', as: 'send_message'

  mount MountainView::Engine => "/styles"

  devise_for :users
  root :to => "dashboard#index"

  resources :debates, only: [:index, :show]
  resources :videos, only: [:show]
  resources :pending_debates, only: [:index, :create]
  resources :members, only: [:show, :index, :edit, :update]
  resources :representations

  scope module: 'members' do
    resources :members, only: [] do
      resources :speeches, only: [:index], on: :member
    end
  end

  resources :search, only: [:index]
  resources :weekly, only: [:index]
end
