Rails.application.routes.draw do
    
    root to: 'pages#home'
    
    get '/about', to:'pages#about'
    
    # get '/posts', to: 'posts#index'
    # get '/posts/new', to: 'posts#new', as: 'new_post'
    # get '/posts/:id', to: 'posts#show', as: 'post'
    # post '/posts', to: 'posts#create'
    
    resources :posts
end
