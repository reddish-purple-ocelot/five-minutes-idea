Rails.application.routes.draw do
  get 'messages/create'
  # get 'room_users/create'
  # get 'room_users/destroy'
  resources :rooms do
    resource :room_users
    resources :messages
  end
  devise_for :users
  # get 'rooms/show'
	root to: 'places#index'
  resources :places do
		collection do
			get :map
		end
  end
	mount ActionCable.server =>'/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
