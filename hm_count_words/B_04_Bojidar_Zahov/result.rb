class Result
	def initialize(words, marks)
		@words = words
		@marks = marks
	end
	
	def to_json
  		my_json = { "marks" => "#{@marks}".to_i, "words" =>@words, }
  		puts JSON.pretty_generate(my_json)
	end
	
	def to_xml 
		xml_counts = REXML::Document.new("")
  		xml_word_counts = xml_counts.add_element("word-counts")
		xml_marks = xml_word_counts.add_element("marks")
		xml_marks.add_text "#{@marks}"
		xml_words = xml_word_counts.add_element("words")
		@words.each do |index, key|
			word = xml_words.add_element('word')
			word.add_attribute("count", key.to_s)
			word.add_text "#{index}"
		end
		xml_print = ""
 		xml_counts.write(xml_print,4)
  		puts xml_print
  	end
  	
	def to_csv 
			
		@words.reverse.each do |element| 
			puts "#{element[0]},#{element[1]}"
		end

		if (@marks!=0)
   		 	print "\"marks\",#{@marks}\n"
		end
	end
end
