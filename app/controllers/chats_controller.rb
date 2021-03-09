class ChatsController < ApplicationController
	before_action :authenticate_user!

	def index
		redirect_to rooms_path
	end
	def create
		@chat = Chat.new(chat_params)
		@chat.user_id = current_user.id
		if @chat.save
			redirect_to request.referer
	  else
	  	@room = UserRoom.find(params[:chat][:room_id])
  	  @others = UserRoom.where(room_id: @room)
  	  @messages = Chat.where(room_id: @room)
		 	render 'rooms/show'
		end
	end

	def destroy
	end

	private

	def chat_params
		params.require(:chat).permit(:message, :room_id)
	end
end
