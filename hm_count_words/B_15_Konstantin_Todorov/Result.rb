require 'csv'
require 'json'
require 'rexml/document'

class Result
attr_accessor :marks_count
attr_accessor :word_counts
def initialize
@marks_count = 0
@word_counts = Hash.new 0
end
def to_csv
word_counts.each do |word,i|
puts "#{word},#{i}"
end
puts "\"marks\",#{marks_count}" if marks_count != 0
end
def to_json
require 'json'
json_output = { marks: marks_count, words: word_counts }
JSON.pretty_generate(json_output)
end
def to_xml
require 'rexml/document'
xml_counts = REXML::Document.new("")
xml_word_counts = xml_counts.add_element('word-counts')
xml_marks = xml_word_counts.add_element('marks')
xml_marks.add_text "#{marks_count}"
xml_words = xml_word_counts.add_element('words')
word_counts.each do |index, key|
word = xml_words.add_element('word')
word.add_attribute( 'count', key)
word.add_text "#{index}"
end
out = ""
xml_counts.write(out, 1)
return out
end
end
