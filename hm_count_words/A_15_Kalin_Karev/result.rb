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
			res = res + "#{word}, #{i.to_s}\n"		
		end
		res
	end

	def to_json
		json_result = { :marks => "#{@counter}".to_i, :words => @answer, }
  		JSON.pretty_generate(json_result)
	end

	def to_xml
		product = ""
		final_xml = REXML::Document.new("")
  		words_xml = final_xml.add_element("word-counts")
  		marks_xml = words_xml.add_element("marks")
  		marks_xml.add_text (@counter.to_s)
  		words_final = words_xml.add_element("words")
  
  		@answer.each do |index, key|
    			word = words_final.add_element('word')
    			word.add_attribute( 'count', key)
   			word.add_text "#{index}"
   		end
  		final_xml.write(product, 1)
  		product	
	end

end