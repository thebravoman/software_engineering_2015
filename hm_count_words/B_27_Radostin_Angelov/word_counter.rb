module WordCounter
  require_relative "word_counter/parser.rb"
  require_relative "word_counter/file_parser.rb"
  require_relative "word_counter/web_parser.rb"
  require_relative 'word_counter/result.rb'

  def self.parse_file(path)
    return FileParser.new.parse(path)
  end

  def self.parse_webpage(url)
    return WebpageParser.new.parse(url)
  end

  def parse
  end

  def self.parse_string(string)
    return Parser.new.parse(string)
  end
end
