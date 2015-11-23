require_relative 'file_parser.rb'
require_relative 'website_parser.rb'

module WordCounter
  def self.parse_file(filename)
    FileParser.new.parse filename
  end

  def self.parse(text)
    Parser.new.parse text
  end

  def self.parse_website(uri)
    WebsiteParser.new.parse uri
  end
end