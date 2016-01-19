require './B_6_Valentin_Stoyanov/word_counter/database'
require './B_6_Valentin_Stoyanov/word_counter/parser'
require './B_6_Valentin_Stoyanov/word_counter/file_parser'
require './B_6_Valentin_Stoyanov/word_counter/web_parser'
require './B_6_Valentin_Stoyanov/word_counter/dir'
require './B_6_Valentin_Stoyanov/word_counter/result'
require './B_6_Valentin_Stoyanov/word_counter/svg_generator'

module WordCounter
  def self.parse string
    Parser.new.parse string
  end

  def self.file_parse filename
    FileParser.new.file_parse filename
  end

  def self.web_parse url
    WebParser.new.web_parse url
  end
  
  def self.dir_parse path
  	DirParser.new.dir_parse path
  end
 
  def self.save_in filename, hash, words, marks
  	DataBase.new.save_in_db filename, hash, words, marks
  end
end
