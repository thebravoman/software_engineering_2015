require './B_16_Konstantin_Todorov/Folder/file_parser'
require './B_16_Konstantin_Todorov/Folder/web_parser'
require './B_16_Konstantin_Todorov/Folder/parser'
require './B_16_Konstantin_Todorov/Folder/result'
module WordCounter
def self.parse string
Parser.new.parse(string)
end
def self.parse_file path
FileParser.new.parse(path)
end
def self.parse_web path
WebParser.new.parse(path)
end
end
