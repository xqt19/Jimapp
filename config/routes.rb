Rails.application.routes.draw do
  get 'instructions/new'
  get 'instructions/create'
  get 'instructions/edit'
  get 'instructions/update'
  get 'instructions/destroy'
  get 'sessions/index'
  get 'sessions/show'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/edit'
  get 'sessions/update'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#index'
  resources :sessions do
    resources :instructions, except: [:index, :show]
  end
end
