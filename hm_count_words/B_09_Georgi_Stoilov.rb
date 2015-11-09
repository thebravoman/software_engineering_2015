require 'rexml/document'
require 'json'
require 'csv'

file = ARGV[0]
format = ARGV[1]

class WordCounter
  def parse_string(string)
    result = Result.new
    result.marks = string.scan(/[,.!?()":\[\];]/).count
    string = string.downcase.split    
    string.each do |word|
      word = word.gsub(/[,.!?()":\[\];]/,'')
      result.word_counter[word] += 1 
    end
    result.word_counter = result.word_counter.sort_by { |key, value| [-value, key] }
    result
  end
  def parse_file (file)
    files = File.open(file, 'r')
    what_is_in_the_file = files.read
    parse_string what_is_in_the_file   
  end 
end  
  
class Result
  attr_accessor :word_counter
  attr_accessor :marks
  
  def initialize 
    @marks = 0
    @word_counter = Hash.new(0)
  end   
    
  def to_csv
			sorted_array = @word_counter.sort_by { |key, value| [-value, key] }
      sorted_array.each do |key, value|
        puts "#{key},#{value}"
      end
		  if @marks != 0
				puts "\"marks\",#{@marks}"
			end
	end
  
  def to_json
    json = { 'marks' => @marks, 'words' => @word_counter }
    puts JSON.pretty_generate(json)
  end
  
  def to_xml
    formatter = REXML::Formatters::Pretty.new
    my_xml = REXML::Document.new('')
    words_counter = my_xml.add_element('words-counter')
    marks = words_counter.add_element('marks').add_text "#{@marks}"
    words = words_counter.add_element('words')
    @word_counter.each do |key, value|
      words.add_element('word', 'count' => value).add_text "#{key}"
    end
    formatter.compact = true
    formatter.write(my_xml, $stdout)
    puts
  end
end

counter = WordCounter.new
result = counter.parse_file file

if format == 'csv' || format == nil
  result.to_csv
  else
  if format == 'json'
    result.to_json
    else
    if format == 'xml'
      result.to_xml
    end
  end
end
