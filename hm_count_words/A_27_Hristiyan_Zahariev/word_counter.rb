require_relative './word_counter/file_parser.rb'
require_relative './word_counter/web_parser.rb'

module WordCounter
  def self.parse_file(filename)
    FileParser.new.parse filename
  end

  def self.parse(string)
    Parser.new.parse string
  end

  def self.parse_webpage(uri)
    WebpageParser.new.parse uri
  end
end
