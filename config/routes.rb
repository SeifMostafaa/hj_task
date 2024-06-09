Rails.application.routes.draw do
  root "articles#index"

  get '/analytics', to: 'analytics#index'
  get '/articles/:id', to: 'articles#show'
  post 'articles/search', to: 'articles#search'
end
