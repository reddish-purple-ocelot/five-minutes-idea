Rails.application.routes.draw do
	root to: 'places#index'
  resources :places do
		collection do
			get :map
		end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
