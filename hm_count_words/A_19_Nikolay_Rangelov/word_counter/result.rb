require 'csv'
require 'json'
require 'rexml/document'

module WordCounter
	class Result
		def initialize(result, counter)
			@result = result
			@counter = counter
		end

		def marks_count
			@counter
		end

		def word_counts
			@result
		end

		def to_csv
			res = ""
			@result.each do|word, i|	
    			res = res + "#{word},#{i.to_s}\n"
  			end
 			res
		end

		def to_json
			json_result = { :marks => "#{@counter}".to_i, :words => @result, }
  			JSON.pretty_generate(json_result)
  			json_result
		end

		def to_xml
			for_printing = ""
			final_xml = REXML::Document.new("")
  			words_xml = final_xml.add_element("word-counts")
  			marks_xml = words_xml.add_element("marks")
  			marks_xml.add_text "#{@counter}"
  			words_final = words_xml.add_element("words")
  
  			@result.each do |index, key|
    			word = words_final.add_element('word')
    			word.add_attribute( 'count', key)
   				word.add_text "#{index}"
   			end
  			final_xml.write(for_printing, 1)
  			for_printing
		end
	end
end

