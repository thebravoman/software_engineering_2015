require 'csv'
require 'json'
require 'rexml/document'

class Result
  attr_accessor :marks_count
  attr_accessor :word_counts
  def initialize 
    @marks_count = 0
    @word_counts = Hash.new(0)
  end

  def to_csv
    word_counts.each do|word, num|
      puts word+','+num.to_s
    end
    if marks_count!=0
      puts '"marks"'+','+marks_count.to_s
    end
  end


  def to_json
    json_hash = {
		"marks"=>marks_count,
		"words"=>word_counts
}
    json_hash2= JSON.pretty_generate(json_hash)		
  end


  def to_xml
  xml_new = REXML::Document.new('')
  xml_word_counts=xml_new.add_element('word-counts')
  xml_mrks =xml_word_counts.add_element('marks')
  xml_mrks.add_text "#{marks_count}"
  xml_words = xml_word_counts.add_element('words')
  word_counts.each do |word, count|
    word = xml_words.add_element('word', 'count' => count).text = "#{word}"
  end
  formatter = REXML::Formatters::Pretty.new(2)
  formatter.compact = true
  formatter.write(xml_new, $stdout)
  puts
  end

end

class WordCounter
  def parse(string)
    result = Result.new
    result.marks_count = string.count(". , ! ? : ; -  _ ' \"[ ] ( ) „ “ * /  ")
    string = string.gsub(/['"].+['"]|[^A-Za-z_]/, ' ').downcase
    word_list = string.split(' ')
    word_list.each do |word|
      result.marks_count += word.count(". , ! ? : ; -  _ ' \"[ ] ( ) „ “ * /  ")
      result.word_counts[word]+=1
    end
    result.word_counts = result.word_counts.sort_by{|word,num| word.downcase}
    result.word_counts = result.word_counts.sort_by {|word,num| [-num,word]}
    result
    end
  def parse_file(filename)
    file = File.open(filename)
    string = ''
    file.each_line do |line|
      string += line
    end
   parse string
  end
end
command = ARGV[1]
word_counter = WordCounter.new
result = word_counter.parse_file ARGV[0]
if command == "json"
 puts result.to_json
elsif command == "xml"
 puts result.to_xml
else
 puts result.to_csv
end
