class PostsController < ApplicationController

	def new
		@post = Post.new
  end

  def create
  	post = Post.new(post_params)
  	post.user_id = current_user.id
  	if post.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  private

  def post_params
  	params.require(:post).permit(:image, :caption)
  end

end