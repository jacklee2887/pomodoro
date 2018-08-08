class UsersController < ApplicationController
	before_action :find_user, only: [:show, :update, :destroy]

	
	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			flash[:success] = "User succesfully created!"
			redirect_to '/login'
		else
			flash[:error] = "Invalid Email or Password"
			redirect_to '/signup'
		end
	end

	def show
		@new_task = Task.new
		@all_tasks = Task.all
	end

	private
	def find_user
		@user = User.find(params[:id])
	end

	def user_params
 		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end

