# extends the already existing ruby class String

class String
  
  # capitalizes the titles
  # 
  def titleize
    self.split(' ').collect {|word| word.capitalize}.join(" ")
  end
  
end
