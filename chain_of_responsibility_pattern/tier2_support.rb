# frozen_string_literal: true

require_relative 'handler'

class Tier2Support < Handler
  def handle(incident)
    if incident[:severity] == 2
      puts "Tier 2 Support handled the incident: #{incident[:description]}"
    else
      super(incident) # Pass to the next handler
    end
  end
end
