Rails.application.routes.draw do
  resources :rooms
  devise_for :users
  get 'rooms/show'
	root to: 'places#index'
  resources :places do
		collection do
			get :map
		end
  end
	mount ActionCable.server =>'/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
