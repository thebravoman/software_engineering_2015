require 'rexml/document'
require 'json'
require 'csv'

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
    words_counter = my_xml.add_element('word-counts')
    marks = words_counter.add_element('marks').add_text "#{@marks}"
    words = words_counter.add_element('words')
    @word_counter.each do |key, value|
      words.add_element('word','count' => value).add_text "#{key}"
    end
    formatter.compact = true
    formatter.write(my_xml, $stdout)
    puts
  end
end
