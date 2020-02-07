Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "messages#new"

  resources :messages, only: [:index, :new, :create] do
    collection do
      get 'search/:text', action: :search
    end
  end

end
