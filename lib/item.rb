class Item
  @@filepath = nil
  
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end
    
  def self.file_exists?
    #  return if file exists
  end
  
  
  def self.create_file
    #  create file
  end
  
  def self.saved_items
    # save item stuff
  end
end