# frozen_string_literal: true

class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @posts = BlogPost.all
    end

    def show
        @post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @post = BlogPost.new
    end

    def create
        @post = BlogPost.new(blog_post_params)
        if @post.save
            redirect_to :index
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @post = BlogPost.find(params[:id])
    end

    def update
        @post = BlogPost.find(params[:id])
        if @post.update(blog_post_params)
            redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = BlogPost.find(params[:id])
        if @post.destroy
            redirect_to root_path
        else
            render :edit
        end
    end

    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end
end
