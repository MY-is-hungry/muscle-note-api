Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :events,  only: [:index]
      resources :records, only: [:index]
      resources :event_records, only: [:index] do
        collection do
          get 'daily'
          get 'monthly'
        end
      end

    end
  end
end