require_relative 'parser'

module WordCounter

  class FileParser
  
    def parse_file(file)
      files = File.open(file, 'r')
      what_is_in_the_file = files.read
      Parser.new.parse_string what_is_in_the_file 
    end
    
  end
  
end
