class CommentsController < ApplicationController
	def create
		@post = Post.find_by_slug(params[:post_id])
		
		@comment = @post.comments.create(params[:comment].permit(:name, :body, :email))
		redirect_to post_path(@post)
		flash[:alert] = "Comment Successfully Created."
	end
	def destroy
		@post = Post.find_by_slug(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
		flash[:alert] = "Comment Successfully Deleted."
	end
end
