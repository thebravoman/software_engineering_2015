require 'csv'
require 'json'
require 'rexml/document'

module WordCounter
class Result
  def initialize
    @marks_count = 0
    @word_counts = {}
  end
#attr_accessor:marks_count, word_counts
  def setWordsMarks words, marks
    @word_counts = words
    @marks_count = marks
  end
  def marks_count
    @marks_count
  end
  def word_counts
    @word_counts
  end
  def to_csv
    @word_counts.each {|key, value| puts "#{key},#{value}"}
    if(@marks_count != 0)
      puts "\"marks\",#{marks_count}"
   end
  end
  def to_json
    new_hash = {}
    new_hash[:marks] = @marks_count
    new_hash[:words] = @word_counts
    JSON.pretty_generate(new_hash)
  end
  def to_xml
    xml = REXML::Document.new
    count_words = xml.add_element("word-counts")
    marks = count_words.add_element("marks")
    marks.add_text "#{@marks_count}"
    words = count_words.add_element("words")
    @word_counts.each do |key, value|
       word = words.add_element("word")
       word.add_attribute("count", value)
       word.add_text "#{key}"
    end
   formatter = REXML::Formatters::Pretty.new(4)
   formatter.compact = true
   formatter.write(xml, $stdout)
   ""
  end
end
end
