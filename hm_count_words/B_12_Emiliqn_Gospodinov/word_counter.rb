require './word_counter/file_parser'
require './word_counter/parser'
require './word_counter/result'
require './word_counter/web_parser'

module WordCounter
  def self.parse(text)
    Parser.new.parse(text)
  end

  def self.parse_file(filepath)
    FileParser.new.parse(filepath)
  end

  def self.parse_webpage(url)
    WebParser.new.parse(url)
  end
end
