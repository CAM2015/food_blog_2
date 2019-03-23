Rails.application.routes.draw do
    
    root to: 'pages#home'
    
    resources :posts
    resources :users, except: [:new]
    
    get '/signup', to: 'users#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    
    #twitter routes
    get 'food-news', to: 'pages#food_news'

    
end
