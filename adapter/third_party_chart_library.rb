# frozen_string_literal: true

class ThirdPartyChartLibrary
  def draw_bar_chart(dataset)
    puts "Third-party: Rendering bar chart with dataset: #{dataset}"
  end

  def draw_pie_chart(values)
    puts "Third-party: Rendering pie chart with values: #{values}"
  end
end
