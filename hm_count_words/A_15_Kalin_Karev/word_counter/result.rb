require 'json'
require 'rexml/document'
require 'csv'

module WordCounter
	class Result
		def initialize(answer, counter)
			@answer = answer
			@counter = counter
		end

		def marks_count
			@counter
		end

		def word_counts
			@answer
		end

		def to_csv
			res = ""
			@answer.each do |word, i|
				res = res + "#{word},#{i.to_s}\n"		
			end
			res
		end

		def to_json
			json_result = { :marks => "#{@counter}".to_i, :words => @answer, }
	  		JSON.pretty_generate(json_result)
	  		json_result
		end

		def to_xml
			product = ""
			final_xml = REXML::Document.new("")
	  		words_xml = final_xml.add_element("word-counts")
	  		marks_xml = words_xml.add_element("marks")
	  		marks_xml.add_text "#{@counter}"
	  		words_final = words_xml.add_element("words")
	  
	  		@answer.each do |index, key|
	    			word = words_final.add_element('word')
	    			word.add_attribute( 'count', key)
	   			word.add_text "#{index}"
	   		end
	  		final_xml.write(product, 1)
	  		product	
		end
		
		def to_svg
			y=0
			w=0
			h=@answer.length * 20
			key, value=@answer.first
			puts'<figure>'
			puts'<svg version="1.1 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="chart" w="600" h="'+h.to_s+'" aria-labelledby="title" role="img">'
			@answer.each do |word, j|
				w = (500*j.to_i)/value.to_i
				puts '<g class="bar">'
					puts'<rect w="'+w.to_s+'" h="19" y="'+y.to_s+'"></rect>'
				puts '<text x="'+(w+5).to_s+'" y="'+(y+8).to_s+'" dy=".35em">'+i.to_s+' '+word+'</text>'
				puts '</g>'
				y = y + 20
			end
			puts '</svg>'
			puts '</figure>'
		end

	end
end
