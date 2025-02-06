# frozen_string_literal: true

# The Device interface (Implementation)
class Device
  def is_enabled
    raise NotImplementedError
  end

  def enable
    raise NotImplementedError
  end

  def disable
    raise NotImplementedError
  end

  def get_volume
    raise NotImplementedError
  end

  def set_volume(percent)
    raise NotImplementedError
  end

  def get_channel
    raise NotImplementedError
  end

  def set_channel(channel)
    raise NotImplementedError
  end
end
