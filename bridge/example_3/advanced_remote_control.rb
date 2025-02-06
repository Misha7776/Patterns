# frozen_string_literal: true

class AdvancedRemoteControl < RemoteControl
  def mute
    @device.set_volume(0)
  end
end
