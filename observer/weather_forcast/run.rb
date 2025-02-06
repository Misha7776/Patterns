require 'thread'

require_relative 'weather_data'
require_relative 'current_conditions_display'
require_relative 'statistics_display'
require_relative 'forecast_display'

# API Key and City Configuration
API_KEY = "d63408f61f20bfceff63d2b0eb47c163"
CITY = "London"

# Create WeatherData instance
weather_data = WeatherData.new(API_KEY, CITY)

# Create display elements
current_conditions = CurrentConditionsDisplay.new
statistics_display = StatisticsDisplay.new
forecast_display = ForecastDisplay.new

# Register displays with the WeatherData object
weather_data.register_observer(current_conditions)
weather_data.register_observer(statistics_display)
weather_data.register_observer(forecast_display)

# Periodically fetch data from the weather API
Thread.new do
  loop do
    weather_data.measurements_changed
    sleep(60) # Fetch data every 60 seconds
  end
end

# Prevent script from exiting
sleep
