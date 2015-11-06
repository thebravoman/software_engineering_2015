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
    word_counts = xml_new.add_element('word-counts')
    xml_mrks =word_counts.add_element('marks')
    xml_mrks.add_text "#{marks_count}"
    xml_words = word_counts.add_element('words')
    word_counts.each do |word, count|
      word = xml_words.add_element('word', 'count' => count).text = "#{word}"
    end
    formatter = REXML::Formatters::Pretty.new
    formatter.compact = true
   xml_new
  end

end
#class WordCounter
# def parse_file(filename)
#file = File.open(filname)
# end
#end
file = File.open(ARGV[0])#opens the file
command = ARGV[1]
result = Result.new
content = String.new #declaring "content"- string
content = file.read#reading the file into the string
content=content.downcase#downcasing all the words
content=content.split(" ")#spliting the string into words
content.each do |word|#counting the words 
  result.marks_count += word.count(". , ! ? : ; -  _ ' \"[ ] ( ) „ “ * / \ ")#counting the marks in every word
  word =word.gsub(/[,()'"„“.*!?:;]/, '')
  result.word_counts[word] += 1
end
result.word_counts = result.word_counts.sort_by{|word,num| word.downcase}#sorting alphabetically
result.word_counts = result.word_counts.sort_by {|word,num| [-num,word]}#sorting by the counter
if command == "json"
 puts result.to_json
elsif command == "xml"
 puts result.to_xml
else
 puts result.to_csv
end
