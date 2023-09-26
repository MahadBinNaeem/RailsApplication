
Rails.application.routes.draw do
  #devise_for :users
  #get "/articles(/:id)", to: "articles#show"                                               //nonresourceful routing
  #get 'articles/:id/with_user/:user_id', to: 'articles#show'                               //static segment
  #get 'articles/:id/:user_id', to: 'articles#show'                                         //dynamic segment

  #get "/articles/:id", to: "articles#show" , contraints: {id: /[A-Z]\d{5}/}                //constraints
  #get 'articles/*other', to: 'articles#unknown'
  get '/stories', to: redirect('/articles')                                                 #redirect one path to another path
  root "articles#index"
  concern :commentable do                                                                   #concerns
    get 'preview', on: :member
    resources :comments, as: "comments"
  end
  #resources :articles, concerns: :commentable,  path_names: { new: 'make', edit: 'change' } override the path segments
  resources :articles, concerns: :commentable
    
  #resources :articles, only: [:index,:new, :show, :edit] do
   # resources :comments
  

=begin
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new", as: :new_article
  get "/articles/:id", to: "articles#show", as: :article
  get "/articles/:id/edit", to: "articles#edit", as: :edit_article
  post "/articles/", to: "articles#create", as: :articles
  patch "/articles/:id", to: "articles#update"
  delete "/articles/:id", to: "articles#destroy"
=end
  #resources :articles

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #delete "/articles/:id", to: "articles#destroy"
  # Defines the root path route ("/")
  #
end
