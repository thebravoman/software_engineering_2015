require_relative './word_counter/result'
require_relative './word_counter/parser'
require_relative './word_counter/file_parser'
require_relative './word_counter/webpage_parser'
require_relative './word_counter/folder_parser'
require_relative './word_counter/database'
require_relative './word_counter/queries'

module WordCounter
  def self.parse(text)
    Parser.new.parse(text)
  end

  def self.parse_file(path)
    FileParser.new.parse(path)
  end

  def self.parse_webpage(url)
    WebpageParser.new.parse(url)
  end
  def self.parse_folder(folder)
    FolderParser.new.parse(folder)
  end
end
