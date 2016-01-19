require 'json'
require 'csv'
require 'rexml/document'
require 'sqlite3'
class Result
  def initialize
    @words = Hash.new(0)
    @marks_sum = 0
  end
   
  attr_accessor :words, :marks_sum

  def makingDataBase
  	dataBase = SQLite3::Database.new ("A_22_Pavel_Kostadinov.db")
  	dataBase.execute "CREATE TABLE IF NOT EXISTS statistics(id INTEGER PRIMARY KEY AUTOINCREMENT,
    source_name TEXT, hash TEXT);"
    dataBase.execute "CREATE TABLE IF NOT EXISTS word_counts(statistic_id INTEGER PRIMARY KEY AUTOINCREMENT,
    word TEXT, count INT);"
    dataBase.execute "INSERT INTO statistics(source_name, hash) VALUES(?,?);", [$filename]
    @words.each do |word, i|
      dataBase.execute "INSERT INTO word_counts(word, count) VALUES(?,?);", [word,i]
    end
    dataBase.execute "INSERT INTO word_counts(word, count) VALUES('$marks$',?);", [@marks_sum]

  end
 
  def to_json
    hash_json = {
                "marks" => @marks_sum,
                "words" => @words
        }
 
  hash_json.to_json
  makingDataBase
  end
  def to_csv
    @words.each do |words, number|
        puts "#{words},#{number}"
    end
 
    if marks_sum != 0
      puts "\"marks\",#{@marks_sum}"
    end
  makingDataBase
  end
 
  def to_xml
    xml_ = REXML::Document.new('')
    word_c_t = xml_.add_element('word-counts')
    word_c_t.add_element('marks').add_text marks_sum.to_s
    words_t = word_c_t.add_element('words')
 
    @words.each do |word, count|
        words_t.add_element('word', {'count' => count}).add_text word
    end
 
    formatter = REXML::Formatters::Pretty.new(4)
    formatter.compact = true
    formatter.write(xml_, $stdout)
    makingDataBase
  end
end
