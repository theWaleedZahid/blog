Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments 
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end  
  end
  root "posts#index"

  get '/about', to: 'pages#about'
end
