class Result
	def initialize(marksCount,wordCount)
		@marks_count = marksCount
		@word_count = wordCount
	end
	
	def get_csv
		@word_count.each { |word, count|  
		puts word + "," + count.to_s
			}
			if @marks_count > 0 
				puts "\"marks\", #{@marks_count}"
			end
	end
	
	def get_json
		puts @word_count
		json = {
			"marks" => @marks_count,
			"words" => @word_count.to_a
		}
		puts JSON.pretty_generate(json) 
	end
	
	def get_xml
		my_xml = REXML::Document.new
		body = my_xml.add_element('word-counts') 
		body.add_element('marks').add_text @marks_count.to_s
		words = body.add_element('words') 
	
		@word_count.each do |word, count| 
			words.add_element('word', {'count' => count}).add_text word 
		end 
	
		printer = REXML::Formatters::Pretty.new(4) 
		printer.compact = true 
		printer.write(my_xml, $stdout)	
	end
end

