require './B_17_Luchezar_Ivanov/word_counter/parser'
require './B_17_Luchezar_Ivanov/word_counter/file_parser'
require './B_17_Luchezar_Ivanov/word_counter/web_parser'
require './B_17_Luchezar_Ivanov/word_counter/result'

module WordCounter
  def self.parse(string)
    Parser.new.parse(string)
  end

  def self.file_parse(filename)
    FileParser.new.file_parse(filename)
  end

  def self.web_parse(url)
    WebParser.new.web_parse(url)
  end
end
