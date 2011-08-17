require "Item"

class Main
  @@actions = ['list', 'find', 'add', 'quit']
  
  def initialize(path=nil)
    Item.filepath = path
    if Item.file_usable?
      puts "Found item file."
    elsif Item.create_file
      puts "Created item file."
    else
      puts "Exiting. \n\n"
      exit!
    end
  end
  
  def launch!
    introduction
    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
    end
    conclusion 
  end
  
  def get_action
    action = nil
    #  Keep asking usr for input until valid action
    until @@actions.include?(action)
      puts "Actions: " + @@actions.join(", ") if action
      print "> "
      usr_response = gets.chomp
      action = usr_response.downcase.strip
    end
    return action    
  end
    
  def do_action(action)    
    case action
    when 'list'
      list
    when 'find'
      puts "finding..."
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts "\nInvalid command.\n"
    end    
  end
  
  
  def introduction
    puts "\n\n <<< Welcome to the item finder >>> \n\n"
    puts "\n\n <<< This is an interactive program to help you find items >>> \n\n"
  end
  
  def list
    puts "\nListings item\n\n".upcase
    items = Item.saved_items
    items.each do |item|
      puts item.name + " | " + item.category + " | " + item.price
    end
  end
  
  
  def add
    puts "\nAdd an item\n\n".upcase
    item = Item.fillform
    
    if item.save
      puts "\nItem Added\n\n"
    else
      puts "\n Save Error: Item not added\n\n"
    end
  end
  
  
  def conclusion
    puts "\n Bye \n\n\n"
  end
end
