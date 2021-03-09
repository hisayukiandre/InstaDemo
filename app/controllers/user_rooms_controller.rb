class UserRoomsController < ApplicationController
	before_action :authenticate_user!
end
