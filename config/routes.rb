# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :lounge_owners

  root to: 'marketing#root'

  get 'pricing', to: 'marketing#pricing'
  get 'faq', to: 'marketing#faq'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
