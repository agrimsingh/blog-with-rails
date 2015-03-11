class PostsController < ApplicationController
#method for index
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def index
		@posts = Post.all.order('created_at DESC')
	end
#method for new posts
	def new
		@post = Post.new
	end
#method for creating a post
	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end	

		@post.save
		redirect_to @post
	end
#method for displaying a post
	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

#method for defining parameters of a post
	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

end
