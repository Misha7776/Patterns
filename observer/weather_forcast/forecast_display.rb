# frozen_string_literal: true

require_relative 'observer'

class ForecastDisplay
  include Observer

  def initialize
    @last_pressure = nil
  end

  def update(_temperature, _humidity, pressure)
    forecast = if @last_pressure.nil?
                 "No forecast available yet"
               elsif pressure > @last_pressure
                 "Improving weather on the way!"
               elsif pressure < @last_pressure
                 "Watch out for cooler, rainy weather"
               else
                 "More of the same"
               end
    puts "Forecast: #{forecast}"
    @last_pressure = pressure
  end
end
