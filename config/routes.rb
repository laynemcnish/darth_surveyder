Rails.application.routes.draw do
  root to: 'surveys#index'
  resources :surveys, only: [:index, :create, :show] do
    post :save_survey_response
  end
  resources :about, only: [:index]
end
