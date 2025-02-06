# frozen_string_literal: true

require_relative 'subject'

require 'httparty'
require 'pry'

class WeatherData
  include Subject
  attr_reader :temperature, :humidity, :pressure

  def initialize(api_key, city)
    @observers = []
    @api_key = api_key
    @city = city
  end

  def register_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each { |observer| observer.update(@temperature, @humidity, @pressure) }
  end

  def measurements_changed
    fetch_weather_data
    notify_observers
  end

  private

  def fetch_weather_data
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{51.507351}&lon=#{-0.127758}&appid=#{@api_key}&units=metric")
    if response.success?
      data = response.parsed_response
      @temperature = data.dig('main', 'temp')
      @humidity = data.dig('main', 'humidity')
      @pressure = data.dig('main', 'pressure')
    else
      puts "Failed to fetch weather data: #{response.code} #{response.message}"
    end
  end
end
