Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resource :feedback, only: %i(new create)
end
