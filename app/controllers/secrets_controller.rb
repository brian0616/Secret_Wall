class SecretsController < ApplicationController
	before_action :require_login, only: [:create, :destroy]
	def index
		@secrets = Secret.all
	end

	def create
		secret = Secret.new(content: params[:content], category: params[:category], user: current_user)
		# @user_secrets = Secret.find(user = current_user.id)
		if secret.invalid?
			flash[:errors] = secret.errors.full_messages
			redirect_to "/users/#{current_user.id}"
		else
			secret.save
			flash[:message] = "Successfully Submitted!"
			redirect_to "/"
		end
	end

	def destroy
		secret = Secret.find(params[:id])
		if secret.user_id == current_user.id
			secret.delete
		redirect_to '/'
		end
	end
end