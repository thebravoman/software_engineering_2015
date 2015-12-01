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

		def to_svg
			y = 0;
			width = 0;
			height = @result.length * 20 
			key, value = @result.first
			puts'<figure>'
			puts '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="chart" width="600" height="'+height.to_s+'" aria-labelledby="title" role="img">'
			@result.each do|word, i|
				width = (500*i.to_i)/value.to_i	
    			puts '<g class="bar">'
   		 		puts '<rect width="'+width.to_s+'" height="19" y="'+y.to_s+'"></rect>'
    			puts '<text x="'+(width+5).to_s+'" y="'+(y+8).to_s+'" dy=".35em">'+i.to_s+' '+word+'</text>'
  				puts'</g>';
  				y = y + 20
  			end
  			puts '</svg>'
			puts '</figure>'
		end
	end
end

