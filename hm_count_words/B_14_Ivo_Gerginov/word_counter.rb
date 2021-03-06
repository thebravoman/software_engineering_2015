require_relative 'word_counter/parser'
require_relative 'word_counter/fileParser'
require_relative 'word_counter/webParser'

module WordCounter
  def self.parseStr(f_str, fPath) 
	Parser.new.parseStr(f_str, fPath)
  end

  def self.parseFile f_path
	FileParser.new.parseFile(f_path)
  end

  def self.parseURL url
	WebParser.new.parseURL(url)
  end

  def self.parseFolder fPath
  	FolderParser.new.parseFolder(fPath)
  end
end