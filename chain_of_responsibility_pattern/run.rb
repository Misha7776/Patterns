require 'pry'
require_relative 'tier1_support'
require_relative 'tier2_support'
require_relative 'tier3_support'

# Create the chain of responsibility
tier1 = Tier1Support.new
tier2 = Tier2Support.new
tier3 = Tier3Support.new
tier1.set_next(tier2).set_next(tier3)

# Simulate incidents
incidents = [
  { severity: 1, description: "Password reset issue" },
  { severity: 2, description: "Application crash" },
  { severity: 3, description: "Database outage" },
  { severity: 4, description: "Major security breach" }
]

# Pass incidents through the chain
incidents.each do |incident|
  tier1.handle(incident)
end
