class SessionsController < ApplicationController

	def login
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to "/"
		else
			message = ["Invalid Login Credentials"]
			flash[:errors] = message
			redirect_to "/"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end

end