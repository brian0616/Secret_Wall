class UsersController < ApplicationController
  before_filter :require_login, except: [:create]

	def create
		user = User.new(email: params[:email], nickname: params[:nickname], password: params[:password])
		if params[:password] != params[:password_confirm]
			flash[:errors] = 'Passwords do not match'
			redirect_to '/'
		elsif user.invalid?
			flash[:errors] = user.errors.full_messages
			redirect_to '/'
		else
			user.save
			session[:user_id] = user.id
			flash[:message] = "Successfully Registered!   Welcome " + user.nickname
			redirect_to '/'
		end
	end

	def show
		@user = User.find(params[:id])
	end

end
