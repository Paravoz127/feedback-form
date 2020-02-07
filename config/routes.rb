Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "messages#new"

  resources :messages, only: [:index, :new, :create] do
    collection do
      get 'search', action: :search, as: :search
    end
  end

end
