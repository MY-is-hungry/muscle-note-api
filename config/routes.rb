Rails.application.routes.draw do
  get '/', to: 'health_check#index'

  namespace 'api' do
    namespace 'v1' do
      resources :categories, only: [:index]
      resources :exercises,  only: [:index] do
        get :with_records, on: :collection
      end
      resources :records,    only: [:index, :create]
    end
  end
end