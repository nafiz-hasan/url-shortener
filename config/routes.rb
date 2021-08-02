# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'aliased_links#index'
  get '/:token', to: 'aliased_links#show', as: :destination
  get '/:token/info', to: 'infos#index', as: :metrics

  resources :aliased_links, except: %i[index show]
end
