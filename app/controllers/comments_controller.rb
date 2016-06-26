class CommentsController < ApplicationController
    	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:comment))
		#@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end
	def upvote
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.liked_by current_user
		redirect_to @post
	end

	def downvote
	  @post = Post.find(params[:post_id])
	  @comment = @post.comments.find(params[:id])
      @comment.downvote_from current_user
      redirect_to @post
	end
end
