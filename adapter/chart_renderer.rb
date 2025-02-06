# frozen_string_literal: true

class ChartRenderer
  def render_bar_chart(data)
    raise NotImplementedError, 'This method should be implemented by a subclass'
  end

  def render_pie_chart(data)
    raise NotImplementedError, 'This method should be implemented by a subclass'
  end
end
