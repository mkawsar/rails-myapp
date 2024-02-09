Rails.application.routes.draw do
    get "/blog/post/new", to: "blog_posts#new", as: :new_blog_post
    get "/blog/post/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
    patch "/blog/post/:id/update", to: "blog_posts#update", as: :update_blog_post
    get "/blog/post/:id", to: "blog_posts#show", as: :blog_post
    post "/blog/post/create", to: "blog_posts#create", as: :blog_posts
    delete "/blog/post/:id/delete", to: "blog_posts#destroy", as: :delete_blog_post
    root "blog_posts#index"
end
