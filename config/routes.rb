Rails.application.routes.draw do
    
    root to: 'pages#home'
    
    resources :posts do
        resources :comments, only: [:create] #nested route: the only route we want exposed for comments is create
    end
    
    #runt 'rails routes | grep comment' to see the nested route below
    #post_comments POST   /posts/:post_id/comments(.:format) comments#create
    
    resources :users, except: [:new]
  
    get '/signup', to: 'users#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    
    #twitter routes
    get 'food-news', to: 'pages#food_news'

    #search routes
    get '/search' => 'pages#search', :as => 'search_page'
end
