# frozen_string_literal: true

require_relative 'observer'

class StatisticsDisplay
  include Observer

  def initialize
    @temperatures = []
  end

  def update(temperature, _humidity, _pressure)
    @temperatures << temperature
    average = @temperatures.sum / @temperatures.size
    puts "Avg/Min/Max temperature: #{average}°C / #{@temperatures.min}°C / #{@temperatures.max}°C"
  end
end
