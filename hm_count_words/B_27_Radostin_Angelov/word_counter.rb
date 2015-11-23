module WordCounter
  require_relative "word_counter/parser.rb"

  def self.parse_file(path)
    return FileParser.new.parse(path)
  end

  def self.parse_webpage(url)
    return WebpageParser.new.parse(url)
  end

  def parse
  end

  def self.parse_string(string)
    string = Parser.new.parse(string)
    return string
  end
end
