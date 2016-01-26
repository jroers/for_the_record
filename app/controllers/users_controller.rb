class UsersController < ApplicationController
	
	def index
	end

	def new
		@user = User.new
	end

	def create
    user_params = params.require(:user).permit(:name, :email, :sex, :dob, :password)
    @user = User.create(user_params)

    redirect_to root_path
	end

	def show
	end

end
