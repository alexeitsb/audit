Rails.application.routes.draw do
  root "home#index"

  namespace :sessions do
    get "new"
    post "create"
    delete "destroy"
  end

  resources :entries, shallow: true do
    resources :attachments
  end
end
