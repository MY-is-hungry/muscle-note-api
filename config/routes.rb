Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :categories, only: [:index]
      resources :exercises,  only: [:index] do
        get :with_records, on: :collection
      end
      resources :records,    only: [:index]
    end
  end
end