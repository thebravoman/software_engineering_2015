require 'rexml/document'
require 'json'
require 'csv'

class Result
  attr_accessor :word_counter
  attr_accessor :marks

  def initialize(marks, words)
    @marks = marks
    @word_counter = words
  end

  def to_csv
    CSV.open('result_Georgi_Stoilov.csv', 'a+', {quote_char: " "}) do |csv|
  	  @word_counter.sort_by{|key, value|[-value, key]}.each{ |element|
  		  csv << [element[0],element[1]]
  	  }
  	  csv << ['"$marks$"', @marks]
    end
	end

  def to_json
    json = { 'marks' => @marks, 'words' => @word_counter }
    File.open('result_Georgi_Stoilov.json', 'a+') do |file|
      file << JSON.pretty_generate(json)
    end
    #puts JSON.pretty_generate(json)
  end

  def to_xml
    formatter = REXML::Formatters::Pretty.new
    my_xml = REXML::Document.new('')
    words_counter = my_xml.add_element('word-counts')
    marks = words_counter.add_element('marks').add_text "#{@marks}"
    words = words_counter.add_element('words')
    @word_counter.each do |key, value|
      words.add_element('word','count' => value).add_text "#{key}"
    end
    formatter.compact = true
    File.open('result_Georgi_Stoilov.xml', 'a+') do |f|
      formatter.write(my_xml, f)
    end
  end
end
