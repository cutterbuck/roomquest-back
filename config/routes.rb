Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/home', to: 'users#create'
      get '/users', to: 'users#index'
      get '/current_user', to: 'users#show'
      post '/vacancies', to: 'vacancies#create'
      get '/vacancies', to: 'vacancies#index'
      delete '/vacancies/:id', to: 'vacancies#destroy'
    end
  end
end
