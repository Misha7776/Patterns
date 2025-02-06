# Component
class FileSystemItem
  def get_size
    raise NotImplementedError, "This method must be implemented by subclasses"
  end

  def show_details
    raise NotImplementedError, "This method must be implemented by subclasses"
  end
end

# Leaf
class FileItem < FileSystemItem
  attr_reader :name, :size

  def initialize(name, size)
    @name = name
    @size = size
  end

  def get_size
    size
  end

  def show_details
    "#{name} (#{size} KB)"
  end
end

# Composite
class FolderItem < FileSystemItem
  attr_reader :name

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def get_size
    @items.reduce(0) { |sum, item| sum + item.get_size }
  end

  def show_details
    details = "#{name}:\n"
    @items.each do |item|
      details += "  - #{item.show_details}\n"
    end
    details
  end
end

# Usage
file1 = FileItem.new("file1.txt", 10)
file2 = FileItem.new("file2.jpg", 200)
folder = FolderItem.new("Documents")
folder.add_item(file1)
folder.add_item(file2)

subfolder = FolderItem.new("Projects")
subfolder.add_item(FileItem.new("project1.rb", 50))
subfolder.add_item(FileItem.new("project2.rb", 30))

folder.add_item(subfolder)

puts folder.show_details
puts "Total size: #{folder.get_size} KB"
