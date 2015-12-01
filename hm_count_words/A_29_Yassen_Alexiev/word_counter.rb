require 'word_counter/file_parser'
require 'word_counter/web_parser'

module WordCounter
  def parse(string)
    Parser.new.parse string
  end

  def parse_file(filename)
    FileParser.new.parse filename
  end

  def parse_webpage(url)
    WebpageParser.new.parse url
  end
end
