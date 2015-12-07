require_relative 'word_counter/file_parser'
require_relative 'word_counter/parser'
require_relative 'word_counter/result'
require_relative 'word_counter/web_parser'

module word_Count

  def self.file_parse(path)
    FileParser.new.parse(path)
  end

  def self.Parse(text)
    Parser.new.parse(text)
  end

  def self.web_parse(url)
    WebParser.new.parse(url)
  end

end
