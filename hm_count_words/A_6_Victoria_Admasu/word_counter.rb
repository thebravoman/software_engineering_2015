require_relative './word_counter/file_parser'
require_relative './word_counter/web_parser'

module WordCounter
  def parse(string)
    Parser.parse (string)
  end

  def parse_file(filename)
    FileParser.parse (filename)
  end

  def parse_web(web)
    WebParser.parse (web)
  end
end
