class RelationshipsController < ApplicationController

	def followers
		user = User.find(params[:user_id])
		@followers = user.follower_users
	end

	def followings
		user = User.find(params[:user_id])
		@followings = user.following_users
	end

	def create
		current_user.follow(params[:user_id])
	  redirect_to request.referer
	end

	def destroy
		current_user.unfollow(params[:user_id])
		redirect_to request.referer
	end
end
