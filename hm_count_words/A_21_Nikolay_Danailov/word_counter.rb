require 'word_counter/file_parser'
require 'word_counter/web_parser'
require 'word_counter/folder_parser'

# Handles word counting
module WordCounter
  def self.parse(string)
    Parser.new.parse string
  end

  def self.parse_file(filename)
    FileParser.new.parse filename
  end

  def self.parse_folder(folder)
  	FolderParser.new.parse folder
  end

  def self.parse_webpage(url)
    WebpageParser.new.parse url
  end
end
