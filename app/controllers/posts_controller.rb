class PostsController < ApplicationController
    before_action :find_post, only: [:show,:edit,:update,:destroy]
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @posts=Post.all.order("created_at DESC")
        if params[:search]
            @posts = Post.where(["title LIKE ?","%#{params[:search]}%"])
        else
            @posts = Post.all.order('created_at DESC')
        end
    end
    def new
        @post = current_user.posts.build
    end
    def show
    end
    def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
			flash[:alert] = "Post Successfully Created."
		else
			render 'new'
		end
    end
    def edit
    end
    def update
		if @post.update(post_params)
			redirect_to @post
			flash[:alert] = "Post Successfully Updated."
		else
			render 'edit'
		end
    end
    def destroy
		@post.destroy
		redirect_to root_path
		flash[:alert] = "Post Successfully Deleted."
    end
    def upvote
        @post = Post.find_by_slug(params[:id])
        @post.upvote_by current_user
        redirect_to post_path
    end
    def downvote
        @post = Post.find_by_slug(params[:id])
        @post.downvote_by current_user
        redirect_to post_path
    end
    private
    def find_post
        @post = Post.find_by_slug(params[:id])
    end   
    def post_params
		params.require(:post).permit(:title, :body)
	end
end
