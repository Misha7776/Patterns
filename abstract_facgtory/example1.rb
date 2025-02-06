# Step 1: Define abstract product interfaces

# Abstract Button interface
class Button
  def paint
    raise NotImplementedError, 'Subclasses must implement the paint method'
  end
end

# Abstract Checkbox interface
class Checkbox
  def paint
    raise NotImplementedError, 'Subclasses must implement the paint method'
  end
end

# Step 2: Implement concrete products for Windows

class WinButton < Button
  def paint
    puts 'Rendering a button in Windows style.'
  end
end

class WinCheckbox < Checkbox
  def paint
    puts 'Rendering a checkbox in Windows style.'
  end
end

# Step 3: Implement concrete products for macOS

class MacButton < Button
  def paint
    puts 'Rendering a button in macOS style.'
  end
end

class MacCheckbox < Checkbox
  def paint
    puts 'Rendering a checkbox in macOS style.'
  end
end

# Step 4: Define the abstract factory interface

class GUIFactory
  def create_button
    raise NotImplementedError, 'Subclasses must implement the create_button method'
  end

  def create_checkbox
    raise NotImplementedError, 'Subclasses must implement the create_checkbox method'
  end
end

# Step 5: Implement concrete factories for Windows and macOS

class WinFactory < GUIFactory
  def create_button
    WinButton.new
  end

  def create_checkbox
    WinCheckbox.new
  end
end

class MacFactory < GUIFactory
  def create_button
    MacButton.new
  end

  def create_checkbox
    MacCheckbox.new
  end
end

# Step 6: Client code that interacts with factories

def create_ui(factory)
  button = factory.create_button
  checkbox = factory.create_checkbox
  button.paint
  checkbox.paint
end

# Example usage:

puts 'Using Windows GUI Factory:'
windows_factory = WinFactory.new
create_ui(windows_factory)

puts "\nUsing macOS GUI Factory:"
mac_factory = MacFactory.new
create_ui(mac_factory)
