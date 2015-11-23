require 'word_counter/file_parser'
require 'word_counter/web_parser'

module WordCounter
  def parse(string)
    Parser.parse string
  end

  def parse_file(filename)
    FileParser.parse filename
  end

  def parse_webpage(url)
    WebpageParser.parse url
  end
end
