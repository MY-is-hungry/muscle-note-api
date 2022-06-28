Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:show, :create]

      get 'monthly_records', to: 'monthly_records#show'
    end
  end
end