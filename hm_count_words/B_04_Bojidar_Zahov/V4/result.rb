class Result
	attr_accessor :marks
	attr_accessor :words
	
	def initialize
		@marks = 0
		@words = Hash.new(0)
	end
	
	def to_json
		my_json = { "marks" => "#{@marks}".to_i, "words" =>@words, }
  		puts JSON.pretty_generate(my_json)
	end

	def to_xml
		xml_counts = REXML::Document.new('')
		xml_word_counts = xml_counts.add_element('word-counts')
		xml_marks = xml_word_counts.add_element('marks')
		xml_marks.add_text"#{@marks}"
		xml_words = xml_word_counts.add_element('words')
		@words.each do |index, key|
			word = xml_words.add_element('word')
			word.add_attribute("count", key.to_s)
			word.add_text "#{index}"
		end
		xml_print = ""
 		xml_counts.write(xml_print,4)
  		puts xml_print
  		xml_print = REXML::Formatters::Pretty.new()
		
		File.open('result.xml', 'w') {|i| xml_print.write(xml_counts, i)}
		
	end
	
	def to_csv
		my_csv = CSV.generate(quote_char: "'") do |csv|
			@words.each do |element|
				csv << element
			end
			if not @marks == 0
				csv << ['"marks"', @marks.to_s]
				#print "\"marks\",#{@marks}\n"
			end
			print my_csv
		end
	end
end
