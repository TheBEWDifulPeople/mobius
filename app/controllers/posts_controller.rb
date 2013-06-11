class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@posts = Post.new
	end

	def create
		@posts = Post.new (post_params)

		if @posts.save
			# save succeeded, redirect to @posts (index)
			redirect_to @posts
		else
			# save failed, render (not redirect to ) new 
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update post_params
	    redirect_to posts_path
	end

	def destroy
	end

	def post_params
		params.require(:post).permit(:img_url)
	end
end
