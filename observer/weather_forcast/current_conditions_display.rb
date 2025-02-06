# frozen_string_literal: true

require_relative 'observer'

class CurrentConditionsDisplay
  include Observer

  def update(temperature, humidity, _pressure)
    puts "Current conditions: #{temperature}°C and #{humidity}% humidity"
  end
end
