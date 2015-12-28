require 'word_counter/parser'

module WordCounter
	
	class FileParser < Parser
		def parse(filename)
			arr = ""	  	
			arr = File.open(filename).read
        	        super arr
    		end
  	end
end 
