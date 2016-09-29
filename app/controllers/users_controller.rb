import HTTParty

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

	def add_location
		@user = User.find_by name: params[:name]
		@location = Location.create city: params[:location][:city], state: params[:location][:state], user: @user
		redirect_to "/#{params[:name]}"	
	end

	def remove_location
		@location = Location.find(params[:location])
		@location.destroy
	end

	def forecast
		@location = Location.find(params[:location])

		@response = HTTParty.get("http://api.wunderground.com/api/235ebfbe56364355/conditions/q/#{@location.state.gsub(/ /, '_')}/#{@location.city.gsub(/ /, '_')}.json")
	end
end
