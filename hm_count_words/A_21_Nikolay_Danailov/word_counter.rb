require 'word_counter/file_parser'
require 'word_counter/web_parser'

# Handles word counting
module WordCounter
  def self.parse(string)
    Parser.parse string
  end

  def self.parse_file(filename)
    FileParser.parse filename
  end

  def self.parse_webpage(url)
    WebParser.parse url
  end
end
