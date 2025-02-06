# Abstract NPC class with a clone method
class NPC
  attr_accessor :name, :health, :attack_power

  def initialize(name, health, attack_power)
    @name = name
    @health = health
    @attack_power = attack_power
  end

  # Abstract clone method to be implemented by concrete subclasses
  def clone
    raise NotImplementedError, "Each subclass must implement the clone method."
  end
end

# Zombie class that inherits from NPC and implements the clone method
class Zombie < NPC
  def initialize(name = "Zombie", health = 100, attack_power = 15)
    super(name, health, attack_power)
  end

  def clone
    # Creates a new instance with the same values
    Zombie.new(@name, @health, @attack_power)
  end
end

# Goblin class that inherits from NPC and implements the clone method
class Goblin < NPC
  def initialize(name = "Goblin", health = 80, attack_power = 10)
    super(name, health, attack_power)
  end

  def clone
    # Creates a new instance with the same values
    Goblin.new(@name, @health, @attack_power)
  end
end

# Initialize one instance of each NPC type
zombie_prototype = Zombie.new
goblin_prototype = Goblin.new

# Cloning NPCs to create new instances without repeating initialization
new_zombie = zombie_prototype.clone
new_goblin = goblin_prototype.clone

# Modify cloned NPCs if needed
new_zombie.name = "Advanced Zombie"
new_zombie.health = 120

new_goblin.attack_power = 12

puts new_zombie.inspect  # #<Zombie:0x0000557d @name="Advanced Zombie", @health=120, @attack_power=15>
puts new_goblin.inspect  # #<Goblin:0x0000557d @name="Goblin", @health=80, @attack_power=12>
