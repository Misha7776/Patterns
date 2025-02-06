# Subject interface
module Image
  def load
    raise NotImplementedError, "Method load must be implemented"
  end

  def display
    raise NotImplementedError, "Method display must be implemented"
  end
end

# Real subject
class RealImage
  include Image

  def initialize(file_path)
    @file_path = file_path
    load
  end

  def load
    puts "Loading image from #{@file_path}..."
  end

  def display
    puts "Displaying image #{@file_path}"
  end
end

# Proxy
class ProxyImage
  include Image

  def initialize(file_path)
    @file_path = file_path
    @real_image = nil
  end

  def load
    @real_image ||= RealImage.new(@file_path) # Load image only if it's needed
  end

  def display
    load # Ensure the image is loaded before displaying
    @real_image.display
  end
end

class DocumentEditor
  def initialize
    @images = []
  end

  def insert_image(file_path)
    @images << ProxyImage.new(file_path) # Insert ProxyImage, not the RealImage
  end

  def render
    @images.each(&:display) # Display all images (will load them if needed)
  end
end

# Example of usage
editor = DocumentEditor.new
editor.insert_image("image1.jpg")
editor.insert_image("image2.jpg")

# Only when the render method is called, the images will be loaded and displayed
editor.render
