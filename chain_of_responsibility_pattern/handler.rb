# frozen_string_literal: true

class Handler
  def initialize
    @next_handler = nil
  end

  # Sets the next handler in the chain
  def set_next(handler)
    @next_handler = handler
    handler # Allows chaining
  end

  # Handles the request or passes it to the next handler
  def handle(incident)
    if @next_handler
      @next_handler.handle(incident)
    else
      puts "No handler available for incident: #{incident[:description]}"
    end
  end
end
