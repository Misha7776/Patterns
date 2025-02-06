# frozen_string_literal: true

require_relative 'handler'

class Tier1Support < Handler
  def handle(incident)
    if incident[:severity] <= 1
      puts "Tier 1 Support handled the incident: #{incident[:description]}"
    else
      super(incident) # Pass to the next handler
    end
  end
end
