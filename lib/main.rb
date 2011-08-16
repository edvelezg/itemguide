require "Item"

class Main
  def initialize(path=nil)
    Item.filepath = path
    if Item.file_exists?
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
    # action loop
      #  what needs to be done?
         # do action
     # repeat until user quits
     conclusion
  end
  
  def introduction
    puts "\n\n <<< Welcome to the item finder >>> \n\n"
    puts "\n\n <<< This is an interactive program to help you find items >>> \n\n"
  end
  
  
  def conclusion
    puts "\n Bye \n\n\n"
  end
  
  
end