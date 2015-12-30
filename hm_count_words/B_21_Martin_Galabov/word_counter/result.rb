require 'json'
require 'csv'
require 'rexml/document'
module WordCounter
class Result
	attr_reader :word_counter, :marks_counter
	def initialize(word_counter, marks_counter)
	@word_counter = word_counter
	@marks_counter = marks_counter
	end
	def marks_count
		puts marks_counter
	end
	def word_counts
		word_counts = word_counter
	end
	def to_csv
		word_counter.each do |key,value| 
		 puts "#{key},#{value}"  
		end  
	 	if marks_counter > 0 then 
	 	puts "\"marks\",#{marks_counter}" 
	 	end 
	end
	def to_json
		if marks_counter > 0
			puts JSON.pretty_generate("marks" => marks_counter,"words" => word_counter)
		end
		if marks_counter == 0
			puts JSON.pretty_generate("words" => word_counter)
		end		
	end
	def to_xml
		my_xml = REXML::Document.new('')
		root = my_xml.add_element('word-counts')
		root.add_element('marks').add_text"#{marks_counter}"
		words = root.add_element('words')
		word_counter.each do |key,value|
			word = words.add_element('word',{'count'=> "#{value}"})
			word.add_text("#{key}")
		end
		formatter = REXML::Formatters::Pretty.new
		formatter.compact = true
		formatter.write(my_xml, $stdout)
		puts "\n"
	end
	
end
end
