
# Step 1: Define the Button interface (abstract class in Ruby)

class Button
  def render(a, b)
    raise NotImplementedError, 'Subclasses must implement the render method'
  end

  def on_click(f)
    raise NotImplementedError, 'Subclasses must implement the on_click method'
  end
end

# Step 2: Concrete button implementations

class WindowsButton < Button
  def render(a, b)
    puts 'Rendering a Windows-style button.'
  end

  def on_click(f)
    puts 'Attaching Windows event handler.'
  end
end

class HTMLButton < Button
  def render(a, b)
    puts 'Returning HTML code for button.'
  end

  def on_click(f)
    puts 'Attaching browser event handler.'
  end
end

# Step 3: Define the base Dialog class (acting as the factory)

class Dialog
  def render
    # Business logic that works with abstract Button type
    ok_button = create_button
    ok_button.on_click(method(:close_dialog))
    ok_button.render(nil, nil)
  end

  # Factory Method - must be implemented by subclasses
  def create_button
    raise NotImplementedError, 'Subclasses must implement the create_button method'
  end

  def close_dialog
    puts 'Closing the dialog...'
  end
end

# Step 4: Concrete Dialog subclasses that implement the factory method

class WindowsDialog < Dialog
  def create_button
    WindowsButton.new
  end
end

class WebDialog < Dialog
  def create_button
    HTMLButton.new
  end
end

# Step 5: Application class to use the factory

class Application
  attr_accessor :dialog

  def initialize(environment)
    @dialog = if environment == 'windows'
                WindowsDialog.new
              elsif environment == 'web'
                WebDialog.new
              else
                raise 'Unknown environment'
              end
  end

  def run
    dialog.render
  end
end

# Example usage:

puts 'Running Windows application:'
app1 = Application.new('windows')
app1.run

puts "\nRunning Web application:"
app2 = Application.new('web')
app2.run
