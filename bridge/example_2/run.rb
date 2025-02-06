# Usage Example

# Creating renderer instances
opengl_renderer = OpenGLRenderer.new
directx_renderer = DirectXRenderer.new

# Creating shape instances with different renderers
circle_opengl = Circle.new(opengl_renderer)
rectangle_opengl = Rectangle.new(opengl_renderer)

circle_directx = Circle.new(directx_renderer)
rectangle_directx = Rectangle.new(directx_renderer)

# Rendering the shapes
circle_opengl.draw        # Output: Rendering Circle with OpenGL
rectangle_opengl.draw     # Output: Rendering Rectangle with OpenGL

circle_directx.draw       # Output: Rendering Circle with DirectX
rectangle_directx.draw    # Output: Rendering Rectangle with DirectX
