Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats do
    # /cats/:cat_id/toys
    resources :toys, only: [:index]
  end
  # /toys/:id
  resources :toys, only: [:create, :show, :update, :destroy]
end
