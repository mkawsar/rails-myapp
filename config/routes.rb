Rails.application.routes.draw do
    get "/blog/post/new", to: "blog_posts#new", as: :new_blog_post
    get "/blog/post/:id", to: "blog_posts#show", as: :blog_post
    post "/blog/post/create", to: "blog_posts#create", as: :blog_posts
    root "blog_posts#index"
end
