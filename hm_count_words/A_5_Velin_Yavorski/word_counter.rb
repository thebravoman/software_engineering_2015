require 'word_counter/parser'
require 'word_counter/file_parser'
require 'word_counter/website_parser'

module WordCounter
    def self.parse(string)   
			Parser.parse(string)
		end     

    def self.parse_file(filename)
			FileParser.parse(filename)
		end

    def self.parse_webpage(url)   
			WebsiteParser.parse(url)
		end
end
=begin
    class Result
			def marks_count
      	@marks_count
			end
			
			def word_counts 
        @word_counts
			end    

      def to_csv   
     		to_csv
			end

			def to_json    
				to_json
			end      
 
    	def to_xml 
				to_xml
			end
		end
end    
=end      
