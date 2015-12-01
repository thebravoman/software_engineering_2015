require_relative 'word_counter/parser'
require_relative 'word_counter/file_parser'
require_relative 'word_counter/web_parser'

module WordCounter

def self.regular_parse(str)
Parse.new.parse(str)
end
def self.parse_file(str)
Parse.new.parse_file(str)
end
def self.web_parse
Parse.new.web_parse
end

end
