# This class contains the information of the item
class Item
  @@filepath = nil
  
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end
    
  def self.file_exists?
    #  return if file exists
    if @@filepath.nil? && File.exists?(@@filepath)
      return true
    else
      return false
    end
  end
  
  
  def self.create_file
    #  create file
  end
  
  def self.saved_items
    # save item stuff
  end
end