module WordCounter
  def self.parse(string)
    Parser.new.parse(string)
  end
  
  def self.parse_file(string)
    self.parse(string)
  end

  def self.parse_website
  
  end
end

