# Application code
chart_data = { 'January' => 30, 'February' => 20, 'March' => 50 }

# Use the adapter
chart_renderer = ChartRendererAdapter.new

# Render bar chart
chart_renderer.render_bar_chart(chart_data)

# Render pie chart
chart_renderer.render_pie_chart(chart_data)
