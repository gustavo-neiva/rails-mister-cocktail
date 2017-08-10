Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, except: [:update, :edit] do
    resources :doses, only: :create
  end

  root 'cocktails#index'
end
