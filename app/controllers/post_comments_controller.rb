class PostCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		post_comment = PostComment.new(post_comment_params)
		post_comment.user_id = current_user.id
		post_comment.post_id = params[:post_id]
		if post_comment.save
			redirect_to request.referer
		else
			redirect_to root_path
		end
	end

	private

	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
