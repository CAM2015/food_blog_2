Rails.application.routes.draw do
    
    root to: 'pages#home'
    
    get '/about', to:'pages#about'
    
    # get '/posts', to: 'posts#index'
    # get '/posts/new', to: 'posts#new', as: 'new_post'
    # get '/posts/:id', to: 'posts#show', as: 'post'
    # post '/posts', to: 'posts#create'
    
    resources :posts
    
    get '/signup', to: 'users#new'
   
    resources :users, except: [:new]
    
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    
    #twitter routes
    get 'food-news', to: 'pages#food_news'

    
   
    
end
