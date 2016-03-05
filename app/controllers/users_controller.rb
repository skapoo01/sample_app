class UsersController < ApplicationController
  	
  	def show
  		@user = User.find(params[:id])
  		# debugger
  		# insert when need to debug anything
  	end

  	def new
  		@user = User.new
  	end

  	def create
  		# don't do mass assignments - too insecure - use "strong parameters" instead
  		@user = User.new(user_params)
  		if @user.save
  			flash[:success] = "Welcome to the Sample App!"
  			redirect_to @user
  		else
  			render 'new'
  		end
  	end

  	private 

  	def user_params 
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
