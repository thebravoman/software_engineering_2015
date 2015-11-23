require_relative './word_counter/file_parser.rb'
require_relative './word_counter/web_parser.rb'

module WordCounter
  def self.parse_file(filename)
    FileParser.new.parse filename
  end

  def self.parse(text)
    Parser.new.parse text
  end

  def self.parse_webpage(uri)
    WebpageParser.new.parse uri
  end
end
