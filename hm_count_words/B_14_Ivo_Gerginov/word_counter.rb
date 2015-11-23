require './B_14_Ivo_Gerginov/word_counter/parser'
require './B_14_Ivo_Gerginov/word_counter/fileParser'
require './B_14_Ivo_Gerginov/word_counter/webParser'

module WordCounter
    def self.parseStr f_str 
      Parser.new.parseStr(f_str)
    end

    def self.parseFile f_path
      FileParser.new.parseFile(f_path)
    end
    def self.parseURL url
      WebParser.new.parseURL(url)
    end
end