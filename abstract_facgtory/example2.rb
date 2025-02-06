# Abstract UIElement interface
class UIElement
  def render
    raise NotImplementedError, "#{self.class} must implement the render method"
  end
end

# Concrete UI elements for Windows
class WindowsButton < UIElement
  def render
    puts "Rendering a Windows Button"
  end
end

class WindowsCheckbox < UIElement
  def render
    puts "Rendering a Windows Checkbox"
  end
end

class WindowsTextbox < UIElement
  def render
    puts "Rendering a Windows Textbox"
  end
end

# Concrete UI elements for MacOS
class MacOSButton < UIElement
  def render
    puts "Rendering a MacOS Button"
  end
end

class MacOSCheckbox < UIElement
  def render
    puts "Rendering a MacOS Checkbox"
  end
end

class MacOSTextbox < UIElement
  def render
    puts "Rendering a MacOS Textbox"
  end
end

# Concrete UI elements for Linux
class LinuxButton < UIElement
  def render
    puts "Rendering a Linux Button"
  end
end

class LinuxCheckbox < UIElement
  def render
    puts "Rendering a Linux Checkbox"
  end
end

class LinuxTextbox < UIElement
  def render
    puts "Rendering a Linux Textbox"
  end
end

# Abstract factory interface
class UIFactory
  def create_button
    raise NotImplementedError, "#{self.class} must implement the create_button method"
  end

  def create_checkbox
    raise NotImplementedError, "#{self.class} must implement the create_checkbox method"
  end

  def create_textbox
    raise NotImplementedError, "#{self.class} must implement the create_textbox method"
  end
end

# Concrete factory for Windows
class WindowsFactory < UIFactory
  def create_button
    WindowsButton.new
  end

  def create_checkbox
    WindowsCheckbox.new
  end

  def create_textbox
    WindowsTextbox.new
  end
end

# Concrete factory for MacOS
class MacOSFactory < UIFactory
  def create_button
    MacOSButton.new
  end

  def create_checkbox
    MacOSCheckbox.new
  end

  def create_textbox
    MacOSTextbox.new
  end
end

# Concrete factory for Linux
class LinuxFactory < UIFactory
  def create_button
    LinuxButton.new
  end

  def create_checkbox
    LinuxCheckbox.new
  end

  def create_textbox
    LinuxTextbox.new
  end
end

# Application code
def render_ui(factory)
  button = factory.create_button
  checkbox = factory.create_checkbox
  textbox = factory.create_textbox

  button.render
  checkbox.render
  textbox.render
end

# Determine the platform and create the appropriate factory
platform = RUBY_PLATFORM.downcase

factory =
  if platform.include?("win")
    WindowsFactory.new
  elsif platform.include?("darwin")
    MacOSFactory.new
  elsif platform.include?("linux")
    LinuxFactory.new
  else
    raise "Unsupported platform: #{platform}"
  end

# Render the UI elements based on the detected platform
render_ui(factory)
