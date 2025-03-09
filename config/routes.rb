Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  
  namespace :api do
    namespace :v1 do
      resources :teams
      resources :players
      resources :users do
        member do 
          patch :promote #for this route enter: localhost:3000/api/v1/users/1/promote
        end
      end
    end
  end
end

#the namespace is the equivalent of all crud routes. 
#resources :products #does the same as the namespace but it wouldnt be within those folders
  #perhaps use the namespacing if you have multiple companies and offer an index of products from each store. allows for you to do a /products with multiple different lists of products