# frozen_string_literal: true

class RemoteControl
  def initialize(device)
    @device = device
  end

  def toggle_power
    if @device.is_enabled
      @device.disable
    else
      @device.enable
    end
  end

  def volume_down
    @device.set_volume(@device.get_volume - 10)
  end

  def volume_up
    @device.set_volume(@device.get_volume + 10)
  end

  def channel_down
    @device.set_channel(@device.get_channel - 1)
  end

  def channel_up
    @device.set_channel(@device.get_channel + 1)
  end
end
