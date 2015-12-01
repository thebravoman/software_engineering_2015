require 'json'
require 'rexml/document'
require_relative '../svg_parser.rb'

module WordCounter
	class Result
		def initialize(result, marks_count)
			@result = result
			@marks_count = marks_count
		end
	
		def marks_count
			@marks_count
		end
	
		def word_counts
			@result
		end
	
		def to_csv
			var = "" 
			@result.each do |word, count|	
				var = var + "#{word},#{count.to_s}\n"
			end
			var
		end		
		
		def to_json
			json_format = { :marks => "#{marks_count}", :words => @result.to_a }
			puts JSON.pretty_generate(json_format)
		end
		
		def to_xml
			format_xml_files = REXML::Document.new("")
		
			format_xml_word_counts = format_xml_files.add_element('word-counts')
		  
			format_xml_marks = format_xml_word_counts.add_element('marks')
			format_xml_marks.add_text "#{marks_count}"
		  
			format_xml_words = format_xml_word_counts.add_element('words')
		  
			@result.each do |index, key|
				word = format_xml_words.add_element('word')
				word.add_attribute( 'count', key)
		
				word.add_text "#{index}"
			end
		
			out = ""
			format_xml_files.write(out, 1)
			puts out
		end 
	end
end