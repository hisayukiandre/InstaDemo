module FavoritesHelper
	def favorited_by?(post, user)
		post.favorites.where(user_id: user.id).exists?
	end
end
