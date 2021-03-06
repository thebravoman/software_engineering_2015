require_relative './word_counter/parse'
require_relative './word_counter/result'
require_relative './word_counter/directory_parser'
require_relative './word_counter/file_parser'
require_relative './word_counter/web_parser'
require_relative './word_counter/svg_generate'

module WordCounter
  def self.parse(content)
    Parser.new.parse(content)
  end

  def self.parse_file(filename)
    FileParser.new.parse(filename)
  end

  def self.parse_webpage(url)
    WebpageParser.new.parse(url)
  end
  
  def self.parse_directory(path)
    DirectoryParser.new.parse(path)
  end
end
