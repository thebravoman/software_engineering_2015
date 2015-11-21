require 'word_counter/file_parser'
require 'word_counter/web_parser'

module WordCounter
  def self.is_uri str
    start = str.split('//').first
    start == 'http:' || start == 'https:'
  end

  def self.parse(info)
    if File.file? info
      FileParser.parse info
    elsif is_uri info
      WebParser.parse info
    else
      Parser.parse info
    end
  end
end
