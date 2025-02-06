# frozen_string_literal: true

require_relative 'handler'

class Tier3Support < Handler
  def handle(incident)
    if incident[:severity] >= 3
      puts "Tier 3 Support handled the incident: #{incident[:description]}"
    else
      super(incident) # Pass to the next handler
    end
  end
end
