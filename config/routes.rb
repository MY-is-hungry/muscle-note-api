Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:show, :create]
      resources :events, only: [:index]

      get 'daily_records', to: 'daily_records#show'
      get 'monthly_records', to: 'monthly_records#show'
    end
  end
end