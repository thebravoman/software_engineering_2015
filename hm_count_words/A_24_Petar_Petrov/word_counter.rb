require_relative 'word_counter/file_parser'
require_relative 'word_counter/parser'
require_relative 'word_counter/web_parser'
require_relative 'word_counter/folder_parser'

module WordCounter
  def self.parse_file(filename)
    FileParser.new.parse(filename)
  end
  
  def self.parse(string)
    Parser.new.parse(string)
  end
  
  def self.parse_webpage(uri)
    WebpageParser.new.parse(uri)
  end
  
  def self.parse_dir(folder)
  	FolderParser.new.parse(folder)
  end
end
