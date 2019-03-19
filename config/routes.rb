Rails.application.routes.draw do
  root 'articles#top'
  resources :articles do
    collection do
      post :confirm
    end
  end
end