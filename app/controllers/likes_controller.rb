class LikesController < ApplicationController

	def create
		Like.create(user: current_user, secret_id: params[:secret_id])
		redirect_to '/'
	end

	def update
		like = Like.find_by(user: current_user.id, secret_id: params[:id])
		like.destroy
		redirect_to '/'
	end
end