class Result
  	def initialize
    		@words = Hash.new(0)
    		@marks_sum = 0
  	end
    
  	attr_accessor :words, :marks_sum
  
  	def to_json
	   	hash_json = {
	              	"marks" => @marks_sum,
	 		"words" => @words
		}
	  
	   	hash_json.to_json
  	end
  
	def to_csv
    		@words.each do |words, number|
 	      		puts "#{words},#{number}"
     	end
  
    	if marks_sum != 0
 		puts "\"marks\",#{@marks_sum}"
     	end
  
  	def to_xml
	    	xml_ = REXML::Document.new('')
	    	word_c_t = xml_.add_element('word-counts')
	    	word_c_t.add_element('marks').add_text marks_sum.to_s
	    	words_t = word_c_t.add_element('words')
  
    	@words.each do |word, count|
	       	words_t.add_element('word', {'count' => count}).add_text word
     	end
  
		formatter = REXML::Formatters::Pretty.new(4)
		formatter.compact = true
		formatter.write(xml_, $stdout)
	end
end
