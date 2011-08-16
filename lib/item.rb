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
    # save item stuff
  end
end