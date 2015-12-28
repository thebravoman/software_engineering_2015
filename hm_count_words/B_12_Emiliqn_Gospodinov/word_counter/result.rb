require 'rexml/document'
require 'rexml/element'
require 'json'
require 'csv'

class Result
	attr_accessor :marks_counter
	attr_accessor :word_counter
	
	def initialize
		@marks_counter = 0
		@word_counter = Hash.new(0)
	end

	def to_csv
		@word_counter.each do |elements|
			puts "#{elements[0]},#{elements[1]}"
		end
		if marks_counter!=0
			puts '"marks",'+"#{@marks_counter}"
		end
		CSV.open("result.csv", "w") do |csv|
			@word_counter.each {|element| csv << element}
		end
	end

	def to_json
		puts JSON.pretty_generate("marks" => @marks_counter,"words" => @word_counter)
	end

	def to_xml
		my_xml = REXML::Document.new('')
		word = my_xml.add_element('word-counts')
		word.add_element('marks').add_text"#{@marks_counter}"
		words_element = REXML::Element.new 'words'
		@word_counter.each do |k,v|
			words_element.add_element('word',{'count' => v}).add_text("#{k}")
		end
		word.add_element(words_element)
		puts my_xml
	end
end
