# Client code example

# Create a TV and a basic remote control
tv = Tv.new
remote = RemoteControl.new(tv)
remote.toggle_power
puts "TV Power: #{tv.is_enabled ? 'On' : 'Off'}" # Output: TV Power: On
remote.volume_up
puts "TV Volume: #{tv.get_volume}" # Output: TV Volume: 60

# Create a Radio and an advanced remote control
radio = Radio.new
advanced_remote = AdvancedRemoteControl.new(radio)
advanced_remote.toggle_power
puts "Radio Power: #{radio.is_enabled ? 'On' : 'Off'}" # Output: Radio Power: On
advanced_remote.mute
puts "Radio Volume: #{radio.get_volume}" # Output: Radio Volume: 0
