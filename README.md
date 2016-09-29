# WeatherFriend

This is a very simple app for getting the current weather conditions. Uses the Weather Underground API.

# Version Info

This was built using Ruby 2.3.1 and Rails 5.0.0.1 on macOS Sierra.

# Installation

1. git clone
2. bundle install 
	* Specifically requires the HTTParty gem for making API calls.
3. rails db:migrate
4. rails server
5. Done!

# Usage Instructions

The login system is very simple, only requiring a username. If the username doesn't exist yet, a confirmation page is shown, allowing users to double-check they provided the correct username.

Once the user logs in, they see a list of their saved locations and a form to quickly save a new location. Clicking any location takes the user to the current weather report for that location.

If there's an problem retreiving the current weather report, the user is shown an error message.