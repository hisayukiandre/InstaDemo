class RoomsController < ApplicationController
	#before_action :room_exists?, only: [:create]
  def index
  	@user_rooms = UserRoom.where(user_id: current_user.id)
  	room_list = []
    @user_rooms.each do |i|
    	room_list.push(i.room_id)
    end
    @rooms = UserRoom.where(room_id: room_list).where.not(user_id: current_user.id)
  end

  def create
  	user = User.find(params[:other_user_id])
  	current_user_rooms = UserRoom.where(user_id: current_user.id)
  	user_rooms = UserRoom.where(user_id: user.id)
  	unless user.id == current_user.id
	  	current_user_rooms.each do |current_user_room|
	  		user_rooms.each do |user_room|
	  			if current_user_room.room_id == user_room.room_id
	  				@is_room = true
	  				@room_id = user_room.room_id
		  		end
		  	end
	  	end
	  	if not @is_room
		  	room = Room.create
		  	UserRoom.create(user_id: current_user.id, room_id: room.id)
		  	UserRoom.create(user_id: params[:other_user_id], room_id: room.id)
		  	redirect_to room_path(room.id)
		  else
		  	redirect_to room_path(@room_id)
  	  end
	  end
  end

  def show
  	@room = UserRoom.find(params[:id])
  	@others = UserRoom.where(room_id: @room)
  	@chat = Chat.new
  	@messages = Chat.where(room_id: @room)
  end
end
