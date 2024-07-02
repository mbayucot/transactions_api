Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Rails.application.routes.draw do
    defaults format: :json do
      namespace :api do
        namespace :v1 do
          post 'transactions/single', to: 'transactions#single'
          post 'transactions/bulk', to: 'transactions#bulk'
        end
      end
    end
  end
end
