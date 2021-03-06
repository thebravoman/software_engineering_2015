require_relative 'word_counter/file_parser'
require_relative 'word_counter/parser'
require_relative 'word_counter/web_parser'

module WordCounter
  def self.parse_file(filename)
    FileParser.new.parse(filename)
  end
  
  def self.parse(string)
    Parser.new.parse(string)
  end
  
  def self.parse_website(uri)
    WebParser.new.parse(uri)
  end
end
