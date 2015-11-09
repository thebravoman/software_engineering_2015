require 'json'
require 'rexml/document'

@xml_json = ARGV[1]

class Result
  def initialize
    @words = Hash.new(0)
    @marks_sum = 0
  end
   
  attr_accessor :words, :marks
  
  def to_json
     hash_json = {
		"marks" => marks_sum.length,
		"words" => h
	}
  end
  def to_csv
    h.each do |words, number|
	puts "#{words},#{number}"
    end

    if marks_sum != 0
      puts "\"marks\",#{marks_sum}"
    end 
  end
  
  def to_xml
    xml_ = REXML::Document.new('') 
    word_c_t = xml_.add_element('word-counts')
    word_c_t.add_element('marks').add_text marks_sum
    words_t = word_c_t.add_element('words')

      h.each do |word, count|
        words_t.add_element('word', {'count' => count}).add_text word
      end
    formatter = REXML::Formatters::Pretty.new(4)
    formatter.compact = true
    formatter.write(xml_, $stdout)
  end
  
class WordCounter
 
  def parse(string)
    result = Result.new
   result.marks_sum = string.scan(/[,.!?:;"()\[\]]/).count
    w = string.downcase.gsub(/[,()'"„“.*?:;]/, ' ').split(" ")
	
	w.each do |words|
		
		result.h[words] += 1
	end
    result.h = result.h.sort_by{|words,number| words.downcase}
    result.h = result.hh.sort_by{|words,number| [-number,words]}
    result
 
  end

  def parse_file(filename)
    f = File.open(filename)
    text = ''
    ff.each_line do |line|
	text += line
    end
    parse text
  end
end

word_counter = WordCounter.new
result = word_counter.parse_file ARGV[0]


  
  
  
if @xml_json == 'json'
  puts result.to_json


elsif @xml_json == 'xml'
  puts result.to_xml

else
  puts result.to_csv
end
	
