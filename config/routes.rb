Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :categories, only: [:index]
      resources :exercises,  only: [:index]
      resources :records,    only: [:index]
    end
  end
end