require_relative './word_counter/file_parser.rb'
require_relative './word_counter/web_parser.rb'
require_relative './word_counter/directory_parser.rb'

module WordCounter
  def self.parse(string)
    Parser.new.parse(string)
  end

  def self.parse_file(filename)
    FileParser.new.parse(filename)
  end

  def self.parse_directory(dirname)
    DirectoryParser.new.parse_dir(dirname)
  end

  def self.parse_webpage(url)
    WebpageParser.new.parse(url)
  end
end
