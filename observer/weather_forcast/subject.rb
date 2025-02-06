# frozen_string_literal: true

module Subject
  def register_observer(observer)
    raise NotImplementedError, 'This method must be implemented in a subclass'
  end

  def remove_observer(observer)
    raise NotImplementedError, 'This method must be implemented in a subclass'
  end

  def notify_observers
    raise NotImplementedError, 'This method must be implemented in a subclass'
  end
end
