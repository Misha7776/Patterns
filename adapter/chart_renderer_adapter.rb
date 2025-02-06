# frozen_string_literal: true

class ChartRendererAdapter < ChartRenderer
  def initialize
    @third_party_chart = ThirdPartyChartLibrary.new
  end

  def render_bar_chart(data)
    # Convert data format if necessary, then delegate to the third-party method
    formatted_data = data.map { |key, value| { label: key, value: value } }
    @third_party_chart.draw_bar_chart(formatted_data)
  end

  def render_pie_chart(data)
    # Convert data format if necessary, then delegate to the third-party method
    values = data.values
    @third_party_chart.draw_pie_chart(values)
  end
end
