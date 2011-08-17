# This class contains the information of the item
class Item
  @@filepath = nil
  
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end
    
  attr_accessor :name, :category, :price
  def self.file_exists?
    #  return if file exists
    if @@filepath.nil? && File.exists?(@@filepath)
      return true
    else
      return false
    end
  end
  
  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.readable?(@@filepath)
    return false unless File.writable?(@@filepath)
    return true
  end
  
  def self.create_file
    File.open(@@filepath, 'w') unless file_exists?
    return file_usable?
  end
  
  def self.saved_items
    items = []
    if file_usable?
      file = File.new(@@filepath, 'r')
      file.each_line do |line|
        items <<  Item.new.import_line(line.chomp)
      end
      file.close
    end
    return items
  end
  
  def import_line(line)
    line_array = line.split("\t")
    @name, @category, @price = line_array
    return self
  end
  
  
  def self.fillform
    args = {}
    print "Item name: "
    args[:name]     = gets.chomp.strip
    
    print "Category type: "
    args[:category] = gets.chomp.strip
    
    print "Average price: "
    args[:price]    = gets.chomp.strip
    
    return self.new(args)
  end
  
  
  def initialize(args={})
    @name     = args[:name] || ""
    @category = args[:category] || ""
    @price    = args[:price] || ""
  end

  def save
    return false unless Item.file_usable?
    File.open(@@filepath, 'a') do |file|
      file.puts "#{[@name, @category, @price].join("\t")}\n"
    end
    return true
  end
  
end
