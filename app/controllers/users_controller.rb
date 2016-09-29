import HTTParty # required to make weather API calls

class UsersController < ApplicationController

	# route: GET / (root)
	def hello
		# do nothing, just present the login form
	end

	# route: POST /login
	def login
		# see if the user exists already
		@user = User.find_by name: params[:user][:name]

		# route to confirmation page if user is new
		# if user exists, present their locations
		if @user != nil
			redirect_to "/#{params[:user][:name]}"
		else
			redirect_to "/new/#{params[:user][:name]}"
		end
	end

	# route: GET /new/:name
	def new
		# do nothing, just show confirmation page
	end

	# route: POST /create/:name
	def create
		# make the user and show their page
		@user = User.create name: params[:name]
		redirect_to "/#{params[:name]}"
	end

	# route: GET /:name
	def show
		# ensure user exists
		@user = User.find_by name: params[:name]

		# if user doesn't exist, show login screen
		if @user == nil
			redirect_to '/'
		end
	end

	# route: POST /:name/add_location
	def add_location
		# create the location and associate it with the user
		@user = User.find_by name: params[:name]
		@location = Location.create city: params[:location][:city], state: params[:location][:state], user: @user
		# show the user their list of locations
		redirect_to "/#{params[:name]}"	
	end

	# NOT IMPLEMENTED IN UI YET
	# route: DELETE /:name/:location
	def remove_location
		@location = Location.find(params[:location])
		@location.destroy
	end

	# route: GET /:user/:location
	def forecast
		@location = Location.find(params[:location])

		@response = HTTParty.get("http://api.wunderground.com/api/235ebfbe56364355/conditions/q/#{@location.state.gsub(/ /, '_')}/#{@location.city.gsub(/ /, '_')}.json")
		@error = nil
		if @response['current_observation'] == nil
			@error = "Couldn't get weather report. Probably an invalid location name."
		end
	end
end
