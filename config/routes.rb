Rails.application.routes.draw do
  resources :topics, only: %i[index show]
  devise_for :users, path: '', path_names:
      { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: %i[show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  mount ActionCable.server => '/cable'
  root to: 'pages#home'
end
