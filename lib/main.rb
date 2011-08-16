require "Item"

class Main
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
      print "> "
      usr_response = gets.chomp

      #  do action
      result = do_action(usr_response)
    end
    conclusion 
  end
  
  def do_action(action)    
    case action
    when 'list'
      puts "Listing..."
    when 'find'
      puts "finding..."
    when 'add'
      puts "adding..."
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
  
  
  def conclusion
    puts "\n Bye \n\n\n"
  end
  
  
end