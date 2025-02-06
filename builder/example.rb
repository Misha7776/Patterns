  # Product
class Computer
  attr_accessor :processor, :ram, :storage, :graphics_card, :peripherals

  def details
    <<~DETAILS
      Processor: #{processor}
      RAM: #{ram}
      Storage: #{storage}
      Graphics Card: #{graphics_card}
      Peripherals: #{peripherals.join(", ")}
    DETAILS
  end
end

# Builder Interface
class ComputerBuilder
  def initialize
    @computer = Computer.new
  end

  def add_processor(processor); end
  def add_ram(ram); end
  def add_storage(storage); end
  def add_graphics_card(graphics_card); end
  def add_peripherals(peripherals); end

  def get_computer
    @computer
  end
end

# Concrete Builder
class GamingComputerBuilder < ComputerBuilder
  def add_processor(processor)
    @computer.processor = processor
  end

  def add_ram(ram)
    @computer.ram = ram
  end

  def add_storage(storage)
    @computer.storage = storage
  end

  def add_graphics_card(graphics_card)
    @computer.graphics_card = graphics_card
  end

  def add_peripherals(peripherals)
    @computer.peripherals = peripherals
  end
end

# Director
class ComputerDirector
  def build_gaming_computer(builder)
    builder.add_processor("Intel i7")
    builder.add_ram("16GB")
    builder.add_storage("512GB SSD")
    builder.add_graphics_card("NVIDIA GTX 3080")
    builder.add_peripherals(["Mechanical Keyboard", "Gaming Mouse"])
    builder.get_computer
  end
end

# Client Code
builder = GamingComputerBuilder.new
director = ComputerDirector.new
gaming_computer = director.build_gaming_computer(builder)

puts gaming_computer.details
