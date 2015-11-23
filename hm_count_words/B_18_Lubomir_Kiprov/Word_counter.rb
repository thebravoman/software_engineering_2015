require_relative 'Word_counter/Parser'
require_relative 'Word_counter/FileParser'
require_relative 'Word_counter/result'

module Word_counter
  def self.parse(string)
    Parser.new.parse(string)
  end

  def self.parse_file(path)
    FileParser.new.parse(path)
  end

  def self.parse_web(url)
    WebParser.new.parse(url)
  end
end
