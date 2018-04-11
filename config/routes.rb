Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'

  # GET /rooms + GET rooms/id + GET rooms/new + POST rooms
  resources :rooms, only: [:index, :show, :new, :create] do
    # GET rooms/:room_id/download + GET rooms/:room_id/settings
     member do
      get :download
      get :settings
    end
    # GET rooms/:room_id/pictures/new + POST rooms/:id/pictures
    resources :pictures, only: [:new, :create]
    # GET /rooms/:room_id/memberships/new + POST rooms/:room_id/memberships
    resources :memberships, only: [:new, :create]
  end

  # GET /pictures/id
  resources :pictures, only: [:show] do
    # POST /pictures/picture_id/comments
    resources :comments, only: [:create]
    # POST /pictures/picture_id/upvote + DELETE /pictures/picture_id/upvote
    resource :upvote, only: [:create, :destroy]
  end

  # profile utilisateur
  resource :profile, only: [:show, :edit, :update]
end

