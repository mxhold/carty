Rails.application.routes.draw do
  root "products#index"

  resource :cart, only: [:update] do
    patch "checkout"
  end
end
