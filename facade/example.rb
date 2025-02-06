# Light class representing the lights in the home
class Light
  def turn_on
    puts "Lights are ON"
  end

  def turn_off
    puts "Lights are OFF"
  end
end

# TemperatureControl class to manage home temperature
class TemperatureControl
  def set_temperature(degree)
    puts "Temperature set to #{degree}°C"
  end
end

# SecuritySystem class to control the security system
class SecuritySystem
  def activate
    puts "Security system activated"
  end

  def deactivate
    puts "Security system deactivated"
  end
end

# HomeAutomationFacade class that simplifies client interactions
class HomeAutomationFacade
  def initialize
    @light = Light.new
    @temperature_control = TemperatureControl.new
    @security_system = SecuritySystem.new
  end

  # Simplified method to turn on lights
  def turn_on_lights
    @light.turn_on
  end

  # Simplified method to turn off lights
  def turn_off_lights
    @light.turn_off
  end

  # Simplified method to set temperature
  def set_temperature(degree)
    @temperature_control.set_temperature(degree)
  end

  # Simplified method to activate security system
  def activate_security
    @security_system.activate
  end

  # Simplified method to deactivate security system
  def deactivate_security
    @security_system.deactivate
  end
end

# Using the HomeAutomationFacade to interact with the system
home_automation = HomeAutomationFacade.new

# Client only interacts with the facade
home_automation.turn_on_lights       # Lights are ON
home_automation.set_temperature(22)  # Temperature set to 22°C
home_automation.activate_security    # Security system activated

# Deactivate security and turn off lights when done
home_automation.deactivate_security  # Security system deactivated
home_automation.turn_off_lights      # Lights are OFF
