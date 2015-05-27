Rails.application.routes.draw do

  namespace :api do #/api/v1/posts
    namespace :v1 do
      resources :posts, only: [:index]
      resources :users, defaults: { format: :json }, only: [:show, :index, :create] do
        post 'sign_in', on: :collection
      end
    end
  end
end
