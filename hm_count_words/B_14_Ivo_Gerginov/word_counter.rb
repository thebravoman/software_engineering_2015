require './B_14_Ivo_Gerginov/word_counter/parser'
require './B_14_Ivo_Gerginov/word_counter/fileParser'

module WordCounter
    def self.parseStr f_str 
      Parser.new.parseStr(f_str)
    end

    def self.parseFile f_path
      FileParser.new.parseFile(f_path)
    end
end