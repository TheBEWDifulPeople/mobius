class PostsController < ApplicationController
	require 'URI'

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comments = Comment.where(post_id: params[:id]).all
	end

	def new
		@posts = Post.new
	end

	def create
		# coming in from /posts/new
		# {"utf8"=>"✓",
 		# "authenticity_token"=>"0ss3yZNjOXc2kdmgeyKmvFzVQ/Tb6dXl9FOkMqn/9zc=",
 		# "post" =>{"img_url"=>"http://deadfix.com/wp-content/uploads/2012/05/Deconstructed-Head-Illustrations-by-Smithe.jpg"}, 
 		# "commit"=>"Post Media"}

		#fail
		param_quoted_from = URI.parse(post_params['img_url']).host
		@posts = Post.new ({img_url: post_params['img_url'], quoted_from: param_quoted_from})

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

	def search
		query = params[:q]
		@posts = Post.search_for(query)
	end

	def destroy
	end

	def post_params
		params.require(:post).permit(:img_url, :tag_list)
	end
end
