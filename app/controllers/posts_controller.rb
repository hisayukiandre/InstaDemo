class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

	def new
		@post = Post.new
  end

  def create
  	post = Post.new(post_params)
  	post.user_id = current_user.id
  	if post.save
  		redirect_to root_path
  	else
      @post = Post.new
  		render :new
  	end
  end

  def index
    # @posts = Post.all
    # per(6)とここに書くかもしくはconfig.default_per_page = 9をinitializer/kaminari_configに書く
  	@posts = Post.includes(:user).page(params[:page]).per(6).reverse_order
  end

  def show
  	@post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.where(post_id: @post)
  end

  private

  def post_params
  	params.require(:post).permit(:image, :caption)
  end

end
