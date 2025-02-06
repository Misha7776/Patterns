# frozen_string_literal: true

module Observer
  def update(temperature, humidity, pressure)
    raise NotImplementedError, 'This method must be implemented in a subclass'
  end
end
