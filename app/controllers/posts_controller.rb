class PostsController < ApplicationController
	respond_to :html, :json

	def index
		@posts = Post.all
		respond_with @posts
	end

	def show
		@post = Post.find(params[:id])
		respond_with @post
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		render :nothing => true
	end
end
