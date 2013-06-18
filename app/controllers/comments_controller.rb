class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		# fail
		post = Post.find(params[:post_id])
		# post.comments.create(params.require(:comment).permit(:comment))
		
		comment = current_user.comments.create(params.require(:comment).permit(:comment))
		post.comments << comment
		
		redirect_to post
	end

	def show
		@comments = Comment.find(params[:id])
	end
end
