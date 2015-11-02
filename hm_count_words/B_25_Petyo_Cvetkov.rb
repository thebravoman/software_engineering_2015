def inputInCsv words_list, marks
  words_list.each do |word,i|
		puts "#{word},#{i}"
	end
	puts "\"marks\",#{marks}"
end



def likeJson words_list, marks
  require 'json'
  my_json = { :marks => "#{marks}".to_i, :words => words_list, }
  puts JSON.pretty_generate(my_json)

end


def likeXml word_counter, marks
require 'rexml/document'
xml_counts = REXML::Document.new("")
xml_word_counts = xml_counts.add_element('word-counts')

xml_marks = xml_word_counts.add_element('marks')
xml_marks.add_text "#{marks}"

xml_words = xml_word_counts.add_element('words')

word_counter.each do |index, key|
word = xml_words.add_element('word')
word.add_attribute( 'count', key)

word.add_text "#{index}"
end
out = ""
xml_counts.write(out, 1)
puts out
end



words_list = Hash.new
FileName = File.open(ARGV[0] , "r")

text = FileName.read.downcase
marks = text.scan(/[,.!?:;"()\[\]]/).count

text = text.gsub(/[^a-z'\s-]/, '').split(" ")
text.each do |word|
  if words_list.has_key?(word)
  	  words_list[word]+=1
  else
    words_list[word] = 1
  end
end
words_list = words_list.sort_by {|word, count| [-count, word]}
case ARGV[1]
when "csv" then inputInCsv words_list, marks
when "json" then likeJson words_list, marks
when "xml" then likeXml words_list, marks
else inputInCsv words_list, marks
end
