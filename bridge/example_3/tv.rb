# frozen_string_literal: true

# Concrete implementation for TV
class Tv < Device
  def initialize
    @enabled = false
    @volume = 50
    @channel = 1
  end

  def is_enabled
    @enabled
  end

  def enable
    @enabled = true
  end

  def disable
    @enabled = false
  end

  def get_volume
    @volume
  end

  def set_volume(percent)
    @volume = percent
  end

  def get_channel
    @channel
  end

  def set_channel(channel)
    @channel = channel
  end
end

# Concrete implementation for Radio
class Radio < Device
  def initialize
    @enabled = false
    @volume = 50
    @channel = 1
  end

  def is_enabled
    @enabled
  end

  def enable
    @enabled = true
  end

  def disable
    @enabled = false
  end

  def get_volume
    @volume
  end

  def set_volume(percent)
    @volume = percent
  end

  def get_channel
    @channel
  end

  def set_channel(channel)
    @channel = channel
  end
end
