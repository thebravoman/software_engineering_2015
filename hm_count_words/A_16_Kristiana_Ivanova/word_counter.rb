require './word_counter/file_parser'
require './word_counter/web_parser'

module WordCounter
  def self.parser(string)
    Parser.parse string
  end

  def self.parse_file(filename)
    FileParser.parse filename
  end

  def self.parse_webpage(web_address)
    WebParser.parse web_address
  end
end