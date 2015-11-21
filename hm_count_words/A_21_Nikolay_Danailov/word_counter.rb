require 'word_counter/file_parser'
require 'word_counter/web_parser'

module WordCounter
  def self.parse(info)
    Parser.parse info
  end

  def self.parse_file(filename)
    FileParser.parse filename
  end

  def self.parse_webpage(url)
    WebParser.parse url
  end
end
