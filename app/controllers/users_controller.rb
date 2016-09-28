class UsersController < ApplicationController
	def hello
		# do nothing
	end

	def login
		@user = User.find_by name: params[:user][:name]

		if @user != nil
			redirect_to "/#{params[:user][:name]}"
		else
			redirect_to "/new/#{params[:user][:name]}"
		end
	end

	def create
		@user = User.create name: params[:name]
		redirect_to "/#{params[:name]}"
	end

	def show
		@user = User.find_by name: params[:name]

		if @user == nil
			redirect_to '/'
		end
	end
end
